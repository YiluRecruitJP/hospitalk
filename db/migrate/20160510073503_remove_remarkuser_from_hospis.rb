class RemoveRemarkuserFromHospis < ActiveRecord::Migration
  def change
    remove_column :hospis, :remarkuser, :string
  end
end
