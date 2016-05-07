class CreateHospis < ActiveRecord::Migration
  def change
    create_table :hospis do |t|
      t.string :remarkuser
      t.string :remarkhospital
      t.string :point
      t.text   :contents
      t.string :address
      t.timestamps
    end
  end
end
