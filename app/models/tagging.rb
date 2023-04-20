class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :resource, polymorphic: true

  validates :resource_type, inclusion: { in: ["Folder", "Note"], message: "must be 'Folder' or 'Note'" }
end
