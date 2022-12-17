class CreatePessoas < ActiveRecord::Migration[6.0]
  def change
    create_table :pessoas do |t|
      t.string :name
      t.string :birth_date
      t.boolean :status

      t.timestamps
    end
  end
end
