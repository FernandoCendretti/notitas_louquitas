class Tag < ActiveRecord::Base
  include ActiveUUID::UUID
  has_many :taggings
  has_many :folders, through: :taggings, source: :resource, source_type: 'Folder'
  has_many :notes, through: :taggings, source: :resource, source_type: 'Note'
end
