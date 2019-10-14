class AddWishlistToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :wishlist, foreign_key: true, type: :uuid
  end
end
