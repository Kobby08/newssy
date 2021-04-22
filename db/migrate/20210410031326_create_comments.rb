class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id, index: true
      t.integer :link_id, index: true

      t.timestamps
    end
  end
end
