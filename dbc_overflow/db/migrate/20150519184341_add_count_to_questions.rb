class AddCountToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :count, :integer, default: 0
  end
end
