# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :city

  validates :cep, :street, :neighborhood, :city_name, :state, presence: true
end
