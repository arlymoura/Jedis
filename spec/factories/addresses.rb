FactoryBot.define do
  factory :address do
    cep { "MyString" }
    street { "MyString" }
    complement { "MyString" }
    neighborhood { "MyString" }
    city_name { "MyString" }
    state { "MyString" }
    ibge { "MyString" }
    city { nil }
  end
end
