class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.references :manager, null: false, index: true, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end
