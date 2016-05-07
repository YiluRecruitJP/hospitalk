class AddNationalityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Nationality, :string
  end
end
