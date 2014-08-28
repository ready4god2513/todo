require 'spec_helper'

describe UsersController do

  let(:user) { FactoryGirl.create(:user) }

  describe '.current_user' do

    it 'is found' do
      get :show, {id: user.id, format: :json}, {user_id: user.id}
      expect(response.status).to eq(200)
    end

    it 'is spoofed or missing' do
      get :show, {id: user.id, format: :json}, {user_id: (user.id * 2)}
      expect(response.status).to eq(401)
      expect(json['error']).to match(/authentication/i)
    end

  end

  describe '.show' do

    context 'no-auth' do

      it 'returns 401' do
        get :show, id: user.id, format: :json
        expect(response.status).to eq(401)
        expect(json['error']).to match(/unauthorized/i)
      end

    end

    context 'current user' do
      it 'returns user' do
        get :show, {id: user.id, format: :json}, {user_id: user.id}
        expect(response.status).to eq(200)
        expect(json['user']).to be_kind_of(Hash)
      end
    end

    context 'other user' do
      # TODO: This might be a bit strange to do, so look back and see what we actually want to happen.
      it 'returns current user' do
        new_user = FactoryGirl.create(:user)
        get :show, { id: user.id, format: :json }, { user_id: new_user.id }
        expect(response.status).to eq(200)
        expect(json['user']).to be_kind_of(Hash)
      end

    end

  end

end