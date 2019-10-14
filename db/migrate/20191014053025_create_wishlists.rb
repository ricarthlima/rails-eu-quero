class CreateWishlists < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :wishlists, id: :uuid do |t|
      t.references :user, foreign_key: true
      t.string :nome
      t.text :desc
      t.string :link, unique: true

      t.timestamps
    end
  end
end
