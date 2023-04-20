class ChangeTagIdInTagging < ActiveRecord::Migration
  def change
    change_table :taggings do |t|
      t.remove :tag_id
      t.uuid :tag_id
    end
  end
end
