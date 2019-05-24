class Task < ApplicationRecord
  belongs_to :user
  has_many :assignments, dependent: :destroy
  
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  ACTIONS = ['visit', 'cleaning', 'check-in or out']
  STATUS = ['to do', 'in progress', 'done']
  FACE_IDS = ['01', '02', '03', '04']

  scope :done, -> { where(status: "2") }
end
