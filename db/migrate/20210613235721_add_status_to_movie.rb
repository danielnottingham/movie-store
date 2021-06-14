class AddStatusToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :status, :integer, null: false, default: 0
  end
end
