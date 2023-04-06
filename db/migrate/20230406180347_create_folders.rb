class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders, id: false do |t|
      t.uuid :id,  primary_key: true
      t.string :name
      t.uuid :parent_id
      t.uuid :user_id

      t.timestamps
    end
  end
end
