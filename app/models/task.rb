class Task < ApplicationRecord
  belongs_to :user
  has_many :assigments
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  ACTIONS = ['visit', 'cleaning', 'check-in/out', 'extra']
  STATUS = ['to do', 'in progress', 'done']

  scope :done, -> { where(status: "2") }
end
