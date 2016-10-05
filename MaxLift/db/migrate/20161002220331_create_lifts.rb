class CreateLifts < ActiveRecord::Migration[5.0]
  def change
    create_table :lifts do |t|
      t.date :date
      t.string :name
      t.boolean :is_metric
      t.integer :weight_lifted
      t.integer :num_reps
      t.integer :one_rm

      t.timestamps
    end
  end
end
