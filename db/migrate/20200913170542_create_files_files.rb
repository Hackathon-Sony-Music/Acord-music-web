class CreateFilesFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :files_files do |t|
      t.binary :data, null: false
      t.string :filename, null: false
      t.string :mime_type, null: false

      t.timestamps
    end

    def self.down
      drop_table :files_files
    end

  end
end
