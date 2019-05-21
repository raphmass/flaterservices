class Task < ApplicationRecord
  belongs_to :user

  ACTIONS = ['Visit', 'Cleaning', 'Check-in/out']
  STATUS = ['Not assigned', 'Assigned']
end
