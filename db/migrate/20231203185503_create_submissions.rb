class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.text :body
      t.integer :word_count
      t.integer :writer_id

      t.timestamps
    end
  end
end
