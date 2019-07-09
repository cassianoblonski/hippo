class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :name, null: false
      t.string :status, null: false, index: true, default: 'pending'
      t.text :description
      t.datetime :deadline
      t.integer :points
      t.references :project, foreign_key: true, null: false

      t.references :requester, null: false, index: true, foreign_key: { to_table: :people }
      t.references :owner, index: true, foreign_key: { to_table: :people }

      t.timestamps

    end
  end
end
