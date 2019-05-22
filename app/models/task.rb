class Task < ApplicationRecord
  belongs_to :user

  ACTIONS = ['visit', 'cleaning', 'check-in/out', 'extra']
  STATUS = ['to do', 'in progress', 'done']
end
