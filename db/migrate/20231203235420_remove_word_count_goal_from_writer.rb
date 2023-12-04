class RemoveWordCountGoalFromWriter < ActiveRecord::Migration[7.0]
  def change
    remove_column :writers, :word_count_goal, :integer
  end
end
