class CreateFandoms < ActiveRecord::Migration[8.1]
  def change
    create_table :fandoms do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
