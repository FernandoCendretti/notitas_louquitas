class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.uuid :user_id, index: true
      t.uuid :plan_id, index: true

      t.timestamps
    end
  end
end
