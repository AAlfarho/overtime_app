class AddOvertimeHoursToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :overtime_hours, :decimal
  end
end
