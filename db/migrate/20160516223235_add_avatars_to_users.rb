class AddAvatarsToUsers < ActiveRecord::Migration
  def self.up
    change_table :hospis do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :hospis, :avatar
  end
end
