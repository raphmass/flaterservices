class Assignment < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates_uniqueness_of :id, scope: :user_id
end
