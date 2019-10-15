class PublicViewController < ApplicationController
    def wishlist
        username = params["username"]
        linker = params["link"]
        
        user = User.where("username = '" + username + "'")
        
        if user.size > 0
            user = user[0]
            
            link = Wishlist.where("user_id = '" + user.id.to_s + "' AND link = '" + linker + "'")
            
            if link.size > 0
                @wishlist = link[0]
                @user = user
                @gifts = Item.where("wishlist_id = '" + @wishlist.id + "'").order("wishlevel DESC, nome ASC")
                @primeiro = false
                @i = 0
                @l = min(5, @gifts.length)
                render :wishlist
            else
                redirect_to root_path
                flash[alert] = "Endereço de lista inválida!" 
            end
        else
            redirect_to root_path
            flash[alert] = "Endereço de usuário inválido!"
        end
    end
    
    private 
    
    
    def min(i,j)
        if i < j then
            return i
        else
            return j
        end
    end
end
