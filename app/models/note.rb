class Note < ActiveRecord::Base
  include ActiveUUID::UUID
  belongs_to :folder
  has_many :taggings, as: :resource
  has_many :tags, through: :taggings
  validates :title, presence: :true
  validates :content, presence: :true
end
