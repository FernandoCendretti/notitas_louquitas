class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :resource, polymorphic: true

  validates :resource_type, inclusion: { in: ["folder", "note"], message: "must be 'folder' or 'note'" }
end
