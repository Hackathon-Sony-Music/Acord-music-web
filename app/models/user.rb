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


   PAIS_ATTRIBUTES = [
      name: 'Dance',
      name: 'Jazz',
      name: 'Pagode',
      name: 'Funk',
      name: 'Eletronica',
      name: 'Gospel',
      name: 'Rock',
      name: 'Hip hop',
      name: 'Heavy metal',
      name: 'Musica de camera',
      name: 'Blues',
      name: 'Sertanejo',
      name: 'Black',
      name: 'Rap',
      name: 'Musica folclorica',
      name: 'Erudita',
      name: 'Samba',
      name: 'Pop',
      name:  'Soul'
    ]

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
      self.registrations = self.registrations? ? self.registrations : false

      self.editor = self.editor.present? ? self.editor : false
      self.name = self.name.present? ? self.name : 'Sem Registro'
      self.categoria = self.categoria.present? ? self.categoria : 'Sem Registro'
      self.pais = self.pais.present? ? self.pais : 'Sem Registro'
      self.estado = self.estado.present? ? self.estado : 'Sem Registro'
      self.cidade = self.cidade.present? ? self.cidade : 'Sem Registro'
      self.telefone = self.telefone.present? ? self.telefone : 'Sem Registro'
      self.cpf_cjpj = self.cpf_cjpj.present? ? self.cpf_cjpj : 'Sem Registro'

   end
end
