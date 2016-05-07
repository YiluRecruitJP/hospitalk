class AddGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Gender, :string
  end
end
