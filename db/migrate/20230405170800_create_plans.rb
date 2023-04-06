class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans, id: false do |t|
      t.uuid :id, primary_key: true
      t.string :name
      t.float :value
      t.string :limit_folder
      t.string :limit_notes
      t.timestamps
    end
  end
end
