class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.integer :user_id, index: true
      t.integer :channel_id, index: true

      t.timestamps
    end
  end
end
