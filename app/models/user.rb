class User < ActiveRecord::Base
  include ActiveUUID::UUID
  has_secure_password
  belongs_to :plan
  has_many :folder

  validates :name, presence: :true
end
