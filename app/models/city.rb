# frozen_string_literal: true

class City < ApplicationRecord
  include CitiesValidators

  has_one_attached :picture

  validates :full_name, :cpf, :cns, :email, :birth_date, :phone_number, presence: true
  validate :cpf_is_valid?, :email_is_valid?, :birth_date_valid?

  def cpf_is_valid?
    return errors.add(:cpf, 'CPF invalido') unless CPF.valid?(cpf)
  end

  def email_is_valid?
    return errors.add(:email, 'Email invalido') unless /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.match?(email)
  end

  def birth_date_valid?
    return if birth_date.blank?

    date_time = birth_date.to_datetime
    year = date_time.year
    actual_year = DateTime.now.year

    return errors.add(:birth_date, 'Data de nascimento invalida') if year > actual_year || (actual_year - year) > 120
  end
end
