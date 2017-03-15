class AddUserIdToSeminar < ActiveRecord::Migration
  def change
    add_column :seminars, :user_id, :integer
  end
end
