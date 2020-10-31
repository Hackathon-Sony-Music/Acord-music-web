class CreateRegisterFinanceiroFoodTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :register_financeiro_food_types do |t|
      t.string :nme_food,    comment: "Nome do alimento",      null: false
      t.string :description, comment: "Descrição do alimento"
      t.string :obs,         comment: "Observações"

      t.timestamps
    end
  end
end
