require "application_system_test_case"

class WishlistsTest < ApplicationSystemTestCase
  setup do
    @wishlist = wishlists(:one)
  end

  test "visiting the index" do
    visit wishlists_url
    assert_selector "h1", text: "Wishlists"
  end

  test "creating a Wishlist" do
    visit wishlists_url
    click_on "New Wishlist"

    fill_in "Desc", with: @wishlist.desc
    fill_in "Link", with: @wishlist.link
    fill_in "Nome", with: @wishlist.nome
    fill_in "User", with: @wishlist.user_id
    click_on "Create Wishlist"

    assert_text "Wishlist was successfully created"
    click_on "Back"
  end

  test "updating a Wishlist" do
    visit wishlists_url
    click_on "Edit", match: :first

    fill_in "Desc", with: @wishlist.desc
    fill_in "Link", with: @wishlist.link
    fill_in "Nome", with: @wishlist.nome
    fill_in "User", with: @wishlist.user_id
    click_on "Update Wishlist"

    assert_text "Wishlist was successfully updated"
    click_on "Back"
  end

  test "destroying a Wishlist" do
    visit wishlists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wishlist was successfully destroyed"
  end
end
