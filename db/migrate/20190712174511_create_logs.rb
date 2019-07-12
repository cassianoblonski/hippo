class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :past_status, null: false
      t.string :current_status, null: false

      t.references :person, foreign_key: true, null: false
      t.references :history, foreign_key: true, null: false

      t.timestamps
    end
  end
end
