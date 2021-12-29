class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :image
      t.integer :score
      t.string :genre
      t.string :notes
      t.date :date

      t.timestamps
    end
  end
end
