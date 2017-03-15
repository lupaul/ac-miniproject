class CreateSeminarRelationships < ActiveRecord::Migration
  def change
    create_table :seminar_relationships do |t|
      t.integer :seminar_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
