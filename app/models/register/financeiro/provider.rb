class Register::Financeiro::Provider < ApplicationRecord

  # validates
    validates :nme_provider, presence: true, uniqueness: true
    validates :email, format: {with: EMAIL_REGEXP}, unless: -> {email.blank?}
    validates :telephone, format: {with: TELPHONE_REGEXP}, unless: -> {telephone.blank?}

    before_save :verifica_atributos

  # human_attribute_name
    HUMANIZED_ATTRIBUTES = {
        id: 'Código',
        nme_modulo: 'Fornecedores',
        nme_provider: 'Nome do Fornecedor',
        email: 'Email',
        telephone: 'Telefone',
        nme_empresa: 'Nome da Empresa',
        description: 'Descrição do Fornecedor',
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
