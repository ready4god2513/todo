require 'spec_helper'

describe AuthenticationsController do

  let(:password) { 'valid-password' }
  let(:user) { FactoryGirl.create(:user, password: password) }

  describe '.create' do

    it 'successful' do
      post :create, user: { email: user.email, password: password }, format: :json
      expect(response.status).to eq(201)
    end

    it 'wrong email' do
      post :create, user: { email: "wrong-#{user.email}", password: password }, format: :json
      expect(response.status).to eq(422)
    end

    it 'wrong password' do
      post :create, user: { email: user.email, password: (password * 2) }, format: :json
      expect(response.status).to eq(422)
    end

    it 'missing credentials' do
      post :create, format: :json
      expect(response.status).to eq(422)
    end

  end

  describe '.destroy' do

    it 'deletes user session' do
      delete 'destroy', {format: :json}, {user_id: user.id}
      expect(response.status).to eq(200)
    end

  end

end