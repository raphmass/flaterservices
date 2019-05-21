class User < ApplicationRecord
  has_many :tasks
  has_many :assignments

  ROLES = %w[owner concierge tenant]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
