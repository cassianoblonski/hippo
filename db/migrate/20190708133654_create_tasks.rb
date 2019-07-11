class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :done, default: false
      t.references :history, foreign_key: true, null: false

      t.timestamps
    end
  end
end
