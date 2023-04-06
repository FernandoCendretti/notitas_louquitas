class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :tag, index: true
      t.uuid :resource_id
      t.string :resource_type

      t.timestamps
    end
  end
end
