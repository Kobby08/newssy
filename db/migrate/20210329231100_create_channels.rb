class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
