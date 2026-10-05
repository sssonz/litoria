class CreateWorks < ActiveRecord::Migration[8.1]
  def change
    create_table :works do |t|
      t.string :title
      t.text :summary
      t.string :work_type
      t.string :rating
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :fandom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
