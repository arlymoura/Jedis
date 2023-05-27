class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :street
      t.string :complement
      t.string :neighborhood
      t.string :city_name
      t.string :state
      t.string :ibge
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
