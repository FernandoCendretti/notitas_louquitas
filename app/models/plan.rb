class Plan < ActiveRecord::Base
  include ActiveUUID::UUID
  has_many :user_plans
  has_many :users, through: :user_plans
end
