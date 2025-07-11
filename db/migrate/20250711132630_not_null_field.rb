class NotNullField < ActiveRecord::Migration[8.0]
  def up
    change_column :tasks, :completed, :boolean, default: false, null: false
    change_column :users, :admin, :boolean, default: false, null: false
  end

  def down
    change_column :tasks, :completed, :boolean, default: nil, null: true
    change_column :users, :admin, :boolean, default: nil, null: true
  end
end
