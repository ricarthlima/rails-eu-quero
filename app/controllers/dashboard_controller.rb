class DashboardController < ApplicationController
    before_action :authenticate_user!
    def index
        @wishlists = Wishlist.where("user_id = " + current_user.id.to_s)
        if current_user.name == nil
            render :add_name
        else
            render :index
        end
    end
    
    def add_name
        valid = validateUsername(params["user"]["username"])
        
        if valid[0]
            current_user.name = params["user"]["name"]
            current_user.username = params["user"]["username"]
            current_user.save
            redirect_to root_path
        else
            flash[alert] = valid[1]
        end
    end
    
    private
    
    def validateUsername(link)
      valid = [true, ""]
      
      # Só pode ter letras minúsculas sem acento
      link.each_char do |letra|
        if letra.ord < 97 or letra.ord > 122
          valid = [false, "O nome de usuário deve conter apenas letras minúsculas."]
        end
      end
      
      # O link deve ser único por usuário
      if User.where("username = '"+link+"'").size > 0
        valid = [false, "O nome de usuário já está em uso."]
      end
      
      return valid
    end
end
