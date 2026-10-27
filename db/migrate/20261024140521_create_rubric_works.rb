class CreateRubricWorks < ActiveRecord::Migration[8.1]
  def change
    create_table :rubric_works do |t|
      t.references :rubric, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true

      t.timestamps

      t.index [ :rubric_id, :work_id ], unique: true
    end
  end
end
