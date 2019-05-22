class Task < ApplicationRecord
  belongs_to :user

  ACTIONS = ['visit', 'cleaning', 'check-in/out', 'extra']
  STATUS = ['not assigned', 'assigned', 'in progress', 'done']
end
