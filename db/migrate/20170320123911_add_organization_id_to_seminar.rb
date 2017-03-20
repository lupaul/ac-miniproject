class AddOrganizationIdToSeminar < ActiveRecord::Migration
  def change
    add_column :seminars, :organization_id, :integer
    
  end
end
