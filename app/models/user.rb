class User < ActiveRecord::Base
  include ActiveUUID::UUID
  has_secure_password
  belongs_to :plan
  has_many :folder

  validates :name, presence: :true
  validates :email, presence: :true, format: { with: /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/, message: "must be a valid email address" }
end
