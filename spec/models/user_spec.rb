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
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

require 'spec_helper'

describe User do

  describe '.new' do

    subject(:user) { FactoryGirl.build(:user, password: password) }
    let(:password) { 'my-password' }

    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }

    describe '.authenticate' do

      it 'correct password' do
        expect(user.authenticate(password)).to be_kind_of(User)
      end

      it 'incorrect password' do
        expect(user.authenticate(password * 2)).to be(false)
      end

    end

  end

  describe 'relationships' do

    it 'has lists' do
      expect(subject).to respond_to(:lists)
    end

  end

end
