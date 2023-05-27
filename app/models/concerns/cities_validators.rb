# frozen_string_literal: true

module CitiesValidators
  extend ActiveSupport::Concern

  include CnsValidator

  def cpf_is_valid?
    return errors.add(:cpf, 'CPF invalido') unless CPF.valid?(cpf)
  end

  def email_is_valid?
    return if /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.match?(email)

    errors.add(:email,
               'Email invalido')
  end

  def birth_date_valid?
    return if birth_date.blank?

    date_time = birth_date.to_datetime
    year = date_time.year
    actual_year = DateTime.now.year

    return unless year > actual_year || (actual_year - year) > 120

    errors.add(:birth_date,
               'Data de nascimento invalida')
  end

  def cns_is_valid?
    return errors.add(:cns, 'CNS invalido') if cns.blank?

    return errors.add(:cns, 'CNS invalido') unless CnsValidator.validate(cns)
  end
end
