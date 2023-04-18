class User < ActiveRecord::Base
  include ActiveUUID::UUID
  has_secure_password
  has_many :user_plans
  has_many :plans, through: :user_plans
  has_many :folders

  validates :name, presence: :true
  validates :email, presence: :true, format: { with: /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/, message: "must be a valid email address" }
end
