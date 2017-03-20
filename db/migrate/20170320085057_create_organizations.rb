class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.date :date
      t.string :location
      t.string :category
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
