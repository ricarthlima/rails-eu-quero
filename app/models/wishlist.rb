class Wishlist < ApplicationRecord
  belongs_to :user
  
  validates_presence_of :nome, message: "Nome não pode ser vazio."
  validates_presence_of :desc, message: "Descrição não pode ser vazia."
  validates_presence_of :link, message: "Link personalizado não pode ser vazio."
  
  
  validates_length_of :link, minimum: 3, message: 'Link personalizado deve ter pelo menos 3 caracteres.'
  #validates_uniqueness_of :link, message: "Link personalizado já utilizado."
end
