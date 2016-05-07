class AddRemarkCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :RemarkCount, :string
  end
end
