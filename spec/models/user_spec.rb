# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do

  describe '.new' do

    subject { FactoryGirl.build(:user) }

    it { is_expected.to be_valid }

  end

end
