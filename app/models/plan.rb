class Plan < ActiveRecord::Base
  include ActiveUUID::UUID
  has_many :user
end
