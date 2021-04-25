class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, null: false, index: true
      t.integer :channel_id, null: false, index: true

      t.timestamps
    end
  end
end
