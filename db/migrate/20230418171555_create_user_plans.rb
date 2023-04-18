class CreateUserPlans < ActiveRecord::Migration
  def change
    create_table :user_plans do |t|
      t.uuid :user_id, index: true
      t.uuid :plan_id, index: true

      t.timestamps
    end
  end
end
