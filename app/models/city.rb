# frozen_string_literal: true

class City < ApplicationRecord
  self.per_page = 10

  include CitiesValidators

  has_one :address, dependent: false
  has_one_attached :picture
  accepts_nested_attributes_for :address

  validates :full_name, :cpf, :cns, :email, :birth_date, :phone_number, presence: true
  validate :cpf_is_valid?, :email_is_valid?, :birth_date_valid?, :cns_is_valid?

  def self.ransackable_attributes(_auth_object = nil)
    %w[active birth_date cns cpf created_at email full_name id phone_number updated_at]
  end
end
