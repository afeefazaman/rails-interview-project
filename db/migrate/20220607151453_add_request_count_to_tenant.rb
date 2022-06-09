class AddRequestCountToTenant < ActiveRecord::Migration[5.2]
  def change
    add_column :tenants, :current_day_count, :integer, null: false, default: 0
    add_column :tenants, :total_requests_count, :integer, null: false, default: 0
  end
end
