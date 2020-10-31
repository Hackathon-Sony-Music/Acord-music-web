class CreateRegisterFinanceiroProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :register_financeiro_providers do |t|
      t.string :nme_provider,   comment: "Nome do Fornecedor",      null: false
      t.string :email,          comment: "Email"
      t.string :telephone,      comment: "Telefone"
      t.string :nme_empresa,    comment: "Nome da empresa"
      t.string :description,    comment: "Descrição"
      t.string :obs,            comment: "Observações"

      t.timestamps
    end
  end
end
