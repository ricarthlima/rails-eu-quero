class Item < ApplicationRecord
    validates_presence_of :nome, message: "Nome não pode ser vazio."
    validates_presence_of :link_img, message: "Link da imagem não pode ser vazio."
    validates_presence_of :link_prod, message: "Link do produto não pode ser vazio."
    validates_presence_of :preco, message: "Preço não pode ser vazio."
    validates_numericality_of :preco, message: "Preço deve ser um número."
    validates_presence_of :desc, message: "Descrição não pode ser vazio."
    validates_presence_of :wishlevel, message: "Nível de desejo não pode ser vazio."
    validates_numericality_of :wishlevel, message: "Wishlevel deve ser um número"
end
