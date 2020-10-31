class Register::AnimalType < ApplicationRecord

# validates
  validates :nme_animal, presence: true, uniqueness: true

# Active_storage
 has_one_attached :image

# human_attribute_name
  HUMANIZED_ATTRIBUTES = {
      id: 'Código',
      nme_modulo: 'Tipos de Animais',
      nme_animal: 'Nome do animal',
      obs: 'Observação',
      image: 'Imagem'
  }.freeze


# method of class
  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

end
