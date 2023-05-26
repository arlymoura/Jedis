class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :full_name
      t.string :cpf
      t.string :cns
      t.string :email
      t.string :phone_number
      t.string :birth_date
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
