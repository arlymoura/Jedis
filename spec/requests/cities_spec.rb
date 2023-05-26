# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/cities', type: :request do
  let(:valid_attributes) do
    build(:city).attributes.deep_symbolize_keys.compact
  end

  let(:invalid_attributes) do
    build(:city, cpf: '99999999').attributes.deep_symbolize_keys.compact
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      City.create! valid_attributes
      get cities_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_city_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      city = City.create! valid_attributes
      get edit_city_url(city)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new City' do
        expect do
          post cities_url, params: { city: valid_attributes }
        end.to change(City, :count).by(1)
      end

      it 'redirects to the created city' do
        post cities_url, params: { city: valid_attributes }
        expect(response).to redirect_to(cities_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new City' do
        expect do
          post cities_url, params: { city: invalid_attributes }
        end.not_to change(City, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post cities_url, params: { city: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested city' do
        city = City.create! valid_attributes
        patch city_url(city), params: { city: new_attributes }
        city.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the city' do
        city = City.create! valid_attributes
        patch city_url(city), params: { city: new_attributes }
        city.reload
        expect(response).to redirect_to(cities_path)
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        city = City.create! valid_attributes
        patch city_url(city), params: { city: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
