# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City do
  subject(:response) { described_class.new(params) }

  let(:full_name) { 'full_name' }
  let(:cpf) { '98835307066' }
  let(:cns) { '187329617340002' }
  let(:email) { 'test@test.com' }
  let(:phone_number) { '11999999999' }
  let(:birth_date) { Time.current.to_s }

  let(:params) do
    {
      full_name:    full_name,
      cpf:          cpf,
      cns:          cns,
      email:        email,
      phone_number: phone_number,
      birth_date:   birth_date
    }
  end

  context 'when all attributes is valid' do
    it 'is valid with valid attributes' do
      expect(response).to be_valid
    end
  end

  context 'when params is invalid' do
    context 'when full_name' do
      let(:full_name) { nil }

      it 'is not valid without a full_name' do
        expect(response).not_to be_valid
      end
    end

    context 'when email' do
      let(:email) { nil }

      it 'is not valid without a email' do
        expect(response).not_to be_valid
      end
    end

    context 'when phone_number' do
      let(:phone_number) { nil }

      it 'is not valid without a phone_number' do
        expect(response).not_to be_valid
      end
    end

    context 'when cpf' do
      context 'when cpf is nil' do
        let(:cns) { nil }

        it 'is not valid without a cns' do
          expect(response).not_to be_valid
        end
      end

      context 'when cpf is invalid' do
        let(:cpf) { '99999999999' }

        it 'is not valid without a cpf' do
          expect(response).not_to be_valid
        end
      end
    end

    context 'when cns' do
      let(:cns) { nil }

      context 'when cns is nil' do
        it 'is not valid with invalid cns' do
          expect(response).not_to be_valid
        end
      end
    end

    context 'when birth_date' do
      let(:birth_date) { DateTime.now + 2.years }

      it 'is not valid with invalid birth_date' do
        expect(response).not_to be_valid
      end
    end
  end
end
