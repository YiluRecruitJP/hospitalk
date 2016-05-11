class AddUserIdToHospis < ActiveRecord::Migration
  def change
    add_column :hospis, :user_id, :integer
  end
end
