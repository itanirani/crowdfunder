class AddFundingPeriodToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :start_date, :datetime
    add_column :projects, :finish_date, :datetime
  end
end
