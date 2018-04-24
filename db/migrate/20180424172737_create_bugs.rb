class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.integer :tester_id
      t.integer :device_id

      t.timestamps
    end
  end
end
