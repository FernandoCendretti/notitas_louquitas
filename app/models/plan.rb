class Plan < ActiveRecord::Base
  include ActiveUUID::UUID
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
