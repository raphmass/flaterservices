class Task < ApplicationRecord
  belongs_to :user
  has_many :assigments

  ACTIONS = ['visit', 'cleaning', 'check-in/out', 'extra']
  STATUS = ['to do', 'in progress', 'done']

  scope :done, -> { where(status: "2") }
end
