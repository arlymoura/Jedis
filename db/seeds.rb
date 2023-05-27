# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
30.times do |i|
  City.create(
    {
      full_name: 'full_name',
      cpf: '98835307066',
      cns: '906915293010008',
      email: 'test@test.com',
      phone_number: '11999999999',
      birth_date: Time.current.to_s,
      address_attributes: {
        cep:          "12345678",
        street:       "Rua dos Bobos",
        complement:   "Nº 0",
        neighborhood: "Centro",
        city_name:    "São Paulo",
        state:        "SP",
        ibge:         "906915293010008"
      }
    }
  )
end
