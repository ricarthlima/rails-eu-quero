module ApplicationHelper
     def wishlist
        @gifts = Gift.where("active = true").order("wishlevel DESC, name ASC")
        @primeiro = false
        @i = 0
        @l = min(5, @gifts.length)
        
        @gifts_inactive = Gift.where("active = false").order("wishlevel DESC, name ASC")
    end
end
