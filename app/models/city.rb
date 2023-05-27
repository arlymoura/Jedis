# frozen_string_literal: true

class City < ApplicationRecord
  include CitiesValidators

  has_one :address, dependent: false
  has_one_attached :picture
  accepts_nested_attributes_for :address

  validates :full_name, :cpf, :cns, :email, :birth_date, :phone_number, presence: true
  validate :cpf_is_valid?, :email_is_valid?, :birth_date_valid?, :cns_is_valid?
end
