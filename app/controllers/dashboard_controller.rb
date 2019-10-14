class DashboardController < ApplicationController
    before_action :authenticate_user!
    def index
        @wishlists = Wishlist.where("user_id = " + current_user.id.to_s)
    end
end
