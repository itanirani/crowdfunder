class AddGoalToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :goal, :integer, :default => 0
  end
end
