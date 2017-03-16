class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.datetime :date
      t.string :location
      t.string :category
      t.integer :seminar_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
