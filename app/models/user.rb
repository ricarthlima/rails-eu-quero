class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #validates_presence_of :username, message: "Nome de usuário não pode ser vazio."
  #validates_uniqueness_of :username, message: 'Nome de usuário em uso.'
  
  #validates_presence_of :name, message: "Nome não pode ser vazio."
  
end
