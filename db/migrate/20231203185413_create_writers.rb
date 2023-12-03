class CreateWriters < ActiveRecord::Migration[7.0]
  def change
    create_table :writers do |t|
      t.integer :word_count_goal

      t.timestamps
    end
  end
end
