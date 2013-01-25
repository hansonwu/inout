class CreateStatusChanges < ActiveRecord::Migration
  def change
    create_table :status_changes do |t|
      t.boolean :in
      t.string :status
      t.integer :user_id

      t.timestamps
    end
    add_index :status_changes, [:user_id, :created_at]
  end
end
