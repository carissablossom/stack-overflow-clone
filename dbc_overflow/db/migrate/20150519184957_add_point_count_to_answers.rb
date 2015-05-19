class AddPointCountToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :point_count, :integer, :default => 1
  end
end
