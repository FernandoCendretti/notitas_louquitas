class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes, id: false do |t|
      t.uuid :id, primary_key: true
      t.text :content
      t.string :title
      t.string :string
      t.uuid :folder_id

      t.timestamps
    end
  end
end
