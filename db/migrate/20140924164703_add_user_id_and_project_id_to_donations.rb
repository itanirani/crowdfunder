class AddUserIdAndProjectIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :user_id, :integer
    add_column :donations, :project_id, :integer
  end
end
