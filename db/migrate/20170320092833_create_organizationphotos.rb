class CreateOrganizationphotos < ActiveRecord::Migration
  def change
    create_table :organizationphotos do |t|
      t.integer :organization_id
      t.string :image

      t.timestamps null: false
    end
  end
end
