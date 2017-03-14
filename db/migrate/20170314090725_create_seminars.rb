class CreateSeminars < ActiveRecord::Migration
  def change
    create_table :seminars do |t|
      t.string :name
      t.datetime :date
      t.string :location
      t.string :category
      

      t.timestamps null: false
    end
  end
end
