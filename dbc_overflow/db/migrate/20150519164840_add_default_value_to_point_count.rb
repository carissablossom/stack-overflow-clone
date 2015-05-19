class AddDefaultValueToPointCount < ActiveRecord::Migration
  def change
    change_column :questions, :point_count, :integer, :default => 1
  end
end
