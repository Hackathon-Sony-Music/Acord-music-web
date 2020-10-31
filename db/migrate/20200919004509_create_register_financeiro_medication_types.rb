class CreateRegisterFinanceiroMedicationTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :register_financeiro_medication_types do |t|
      t.string :nme_medication,    comment: "Nome do Medicamento",      null: false
      t.string :description,       comment: "Descrição do alimento"
      t.string :obs,               comment: "Observações"

      t.timestamps
    end
  end
end
