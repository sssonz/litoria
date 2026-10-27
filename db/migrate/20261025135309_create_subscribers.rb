
class CreateSubscribers < ActiveRecord::Migration[8.1]
  def change
    create_table :subscribers do |t|
      t.string :email, null: false
      t.datetime :consented_at, null: false

      t.timestamps
    end

    add_index :subscribers, :email, unique: true
  end
end
