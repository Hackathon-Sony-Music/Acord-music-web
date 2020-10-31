class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :set_tip_menu

  # human_attribute_name
   HUMANIZED_ATTRIBUTES = {
       id: 'Código',
       user_name: 'Nome de Usuario',
       email: 'Email',
       password: 'Senha'
   }.freeze

  # method of class
   def self.human_attribute_name(attr, options = {})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end

   # nest_form
   belongs_to :files, class_name: "Files::File", optional: true
   accepts_nested_attributes_for :files, allow_destroy: true

   private
   def set_tip_menu
     self.tip_menu = self.tip_menu.present? ? self.tip_menu : false
   end
end
