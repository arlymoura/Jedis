# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address do
  subject(:response) { described_class.new(params) }

  let(:cep) { '64017120' }
  let(:street) { 'Rua ali' }
  let(:complement) { '' }
  let(:neighborhood) { 'centro' }
  let(:city_name) { 'teresina' }
  let(:state) { 'PI' }
  let(:ibge) { 'IBGE' }
  let(:city) { create(:city) }

  let(:params) do
    {
      cep:          cep,
      street:       street,
      complement:   complement,
      neighborhood: neighborhood,
      city_name:    city_name,
      state:        state,
      ibge:         ibge,
      city:         city
    }
  end

  context 'when all attributes is valid' do
    it 'is valid with valid attributes' do
      expect(response).to be_valid
    end
  end

  context 'when params is invalid' do
    context 'when cep' do
      let(:cep) { nil }

      it 'is not valid without a cep' do
        expect(response).not_to be_valid
      end
    end

    context 'when street' do
      let(:street) { nil }

      it 'is not valid without a street' do
        expect(response).not_to be_valid
      end
    end

    context 'when neighborhood' do
      context 'when neighborhood is nil' do
        let(:neighborhood) { nil }

        it 'is not valid without a cns' do
          expect(response).not_to be_valid
        end
      end
    end

    context 'when city_name' do
      let(:city_name) { nil }

      context 'when city_name is nil' do
        it 'is not valid with invalid city_name' do
          expect(response).not_to be_valid
        end
      end
    end

    context 'when state' do
      let(:state) { nil }

      it 'is not valid with invalid state' do
        expect(response).not_to be_valid
      end
    end
  end
end
