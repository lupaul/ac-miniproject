class CreateSeminarphotos < ActiveRecord::Migration
  def change
    create_table :seminarphotos do |t|
      t.integer :seminar_id
      t.string :image

      t.timestamps null: false
    end
  end
end
