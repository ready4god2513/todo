require 'spec_helper'

describe HomeController do

  describe '.index' do

    it 'renders page' do
      expect(get: '/').to be_routable
    end

  end

end