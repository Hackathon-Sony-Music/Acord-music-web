class Register::Financeiro::MedicationType < ApplicationRecord

  # validates
    validates :nme_medication, presence: true, uniqueness: true

    before_save :verifica_atributos

  # human_attribute_name
    HUMANIZED_ATTRIBUTES = {
        id: 'Código',
        nme_modulo: 'Tipos de Medicamento',
        nme_medication: 'Nome do Medicamento',
        description: 'Descrição do Medicamento',
        obs: 'Observação',
        image: 'Imagem'
    }.freeze


  # method of class
    def self.human_attribute_name(attr, options = {})
      HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    end

    private

    def verifica_atributos
      self.description = self.description.present? ? self.description : "Sem"
      self.obs = self.obs.present? ? self.obs : "Sem"
    end

end
