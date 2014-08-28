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

class List < ActiveRecord::Base
  
  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }
  validates :user, presence: true

end
