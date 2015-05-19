class AddPointCountToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :point_count, :integer
  end
end
