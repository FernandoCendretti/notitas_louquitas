class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags, id: false do |t|
      t.uuid :id, primary_key: true
      t.text :name

      t.timestamps
    end
  end
end
