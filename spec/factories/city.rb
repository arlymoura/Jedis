# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    full_name { 'full_name' }
    cpf { '98835307066' }
    cns { '187329617340002' }
    email { 'teste@teste.com' }
    phone_number { '11999999999' }
    birth_date { Time.current.to_s }
  end
end
