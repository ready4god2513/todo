# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  sort_order :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_lists_on_user_id  (user_id)
#

require 'spec_helper'

describe List do

  subject { FactoryGirl.build(:list) }

  it { is_expected.to be_valid }

  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:user) }

    it 'name too long' do
      subject.name = ('a' * 101)
      expect(subject).not_to be_valid
    end
  end

end
