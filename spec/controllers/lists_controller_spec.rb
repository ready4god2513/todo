require 'spec_helper'

describe ListsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:lists) { FactoryGirl.create_list(:list, 3, user: user) }

  describe '.index' do

    context 'no-auth' do

      it 'returns 401' do
        get :index, format: :json
        expect(response.status).to eq(401)
      end

    end

    context 'authenticated' do

      it 'returns all lists' do
        lists
        get :index, { format: :json }, { user_id: user.id }
        expect(response.status).to eq(200)
        expect(json['lists'].length).to eq(user.lists.length)
      end

    end

  end

  describe '.show' do

    context 'no-auth' do

      it 'returns 401' do
        get :show, id: lists.first.id, format: :json
        expect(response.status).to eq(401)
      end

    end

    context 'authenticated' do

      it 'has correct attributes', :focus do
        item = lists.first
        get :show, { id: item.id, format: :json }, { user_id: user.id }
        expect(json['list']).to eq({id: item.id, name: item.name, sort_order: item.sort_order})
      end

      it 'returns list' do
        get :show, { id: lists.first.id, format: :json }, { user_id: user.id }
        expect(response.status).to eq(200)
        expect(json['list']).to be_kind_of(Hash)
      end

      context 'spoofed user' do

        it 'returns 404' do
          get :show, { id: lists.first.id, format: :json }, { user_id: FactoryGirl.create(:user).id }
          expect(response.status).to eq(404)
        end

      end

    end

  end

  describe '.create' do

    context 'no-auth' do

      it 'returns 401' do
        post :create, { list: FactoryGirl.build(:list).attributes, format: :json }
        expect(response.status).to eq(401)
      end

    end

    context 'authenticated' do

      it 'is valid' do
        post :create, { list: FactoryGirl.build(:list, name: 'my title').attributes, format: :json }, { user_id: user.id }
        expect(response.status).to eq(201)
        expect(json['list']).to be_kind_of(Hash)
      end

      it 'not valid' do
        attrs = FactoryGirl.build(:list, name: 'my title').attributes.tap do |a|
          a.delete("name")
        end

        post :create, { list: attrs, format: :json }, { user_id: user.id }
        expect(response.status).to eq(422)
      end

    end

  end

end