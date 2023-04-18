class Folder < ActiveRecord::Base
  include ActiveUUID::UUID
  belongs_to :user
  has_many :childrens, class_name: 'Folder', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Folder'
  has_many :notes
  has_many :taggings, as: :resource
  has_many :tags, through: :taggings
  validates :name, presence: :true
end
