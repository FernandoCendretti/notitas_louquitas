class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.uuid :id, primary_key: true
      t.string :name
      t.string :email
      t.string :password_digest
      t.uuid :plan_id

      t.timestamps
    end
  end
end
