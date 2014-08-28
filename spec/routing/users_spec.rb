require 'spec_helper'

describe 'UsersRoutes' do

  context 'invalid' do

    it '.index' do
      expect(get: '/users').not_to be_routable
    end

    it '.create' do
      expect(post: '/users').not_to be_routable
    end

  end

  context 'valid' do

    it '.show' do
      expect(get: '/users/11').to route_to(controller: 'users', action: 'show', id: '11')
    end

    it '.update' do
      expect(put: '/users/11').to route_to(controller: 'users', action: 'update', id: '11')
    end

    it '.destroy' do
      expect(delete: '/users/11').to route_to(controller: 'users', action: 'destroy', id: '11')
    end

  end

end