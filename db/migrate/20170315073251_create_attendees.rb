class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.integer :seminar_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
