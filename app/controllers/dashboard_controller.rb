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
      
      # Só pode ter letras minúsculas sem acento, números ou hífens
      link.each_char do |letra|
        if !(
            (letra.ord >= 97 and letra.ord <= 122) or 
            (letra.ord == 45) or 
            (letra.ord >= 48 and letra.ord <= 57)
            )
          valid = [false, "O nome de usuário deve conter apenas letras minúsculas sem acento, números e hífens."]
        end
      end
      
      # O link deve ser único por usuário
      if User.where("username = '"+link+"'").size > 0
        valid = [false, "O nome de usuário já está em uso."]
      end
      
      return valid
    end
end
