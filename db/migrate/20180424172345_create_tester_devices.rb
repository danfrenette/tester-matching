class CreateTesterDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :tester_devices do |t|
      t.integer :device_id
      t.integer :tester_id

      t.timestamps
    end
  end
end
