class CreateChapters < ActiveRecord::Migration[8.1]
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :body
      t.integer :position
      t.references :work, null: false, foreign_key: true

      t.timestamps
    end
  end
end
