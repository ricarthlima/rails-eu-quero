class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :uuid do |t|
      t.string :nome
      t.string :link_img
      t.string :link_prod
      t.float :preco
      t.text :desc
      t.integer :wishlevel
      t.boolean :ativo

      t.timestamps
    end
  end
end
