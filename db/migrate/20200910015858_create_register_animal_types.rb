class CreateRegisterAnimalTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :register_animal_types do |t|
      t.string :nme_animal, comment: "Nome do animal a ser Cadastrado(Ovino, Bovino, Caprino, Suíno, Equinos...)"
      t.string :obs, comment: "Comentario sobre o tipo de animal"

      t.timestamps
    end
  end
end
