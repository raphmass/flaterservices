class Task < ApplicationRecord
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  ACTIONS = ['visit', 'cleaning', 'check-in/out', 'extra']
  STATUS = ['not assigned', 'assigned', 'in progress', 'done']
end
