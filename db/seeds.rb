require "csv"

puts "Seeding database..."

tester_csv_data = File.read(Rails.root.join("db", "data", "testers.csv"))
CSV.parse(tester_csv_data).drop(1).each do |tester_data|
  id, first_name, last_name, country, last_sign_in_at = tester_data

  Tester.create! do |tester|
    tester.id = id
    tester.first_name = first_name
    tester.last_name = last_name
    tester.country = country
    tester.last_sign_in_at = DateTime.parse(last_sign_in_at)
  end
end

ActiveRecord::Base.connection.reset_pk_sequence!("testers")


device_csv_data = File.read(Rails.root.join("db", "data", "devices.csv"))
device_data_without_headers = CSV.parse(device_csv_data).drop(1)
device_data_without_headers.each do |device_data|
  id, description = device_data

  Device.create! do |device|
    device.id = id
    device.description = description
  end
end

ActiveRecord::Base.connection.reset_pk_sequence!("devices")


tester_device_csv_data = File.read(Rails.root.join("db", "data", "tester_device.csv"))
tester_device_data_without_headers = CSV.parse(tester_device_csv_data).drop(1)
tester_device_data_without_headers.each do |device_data|
  tester_id, device_id = device_data

  TesterDevice.create! do |tester_device|
    tester_device.tester_id = tester_id
    tester_device.device_id = device_id
  end
end

ActiveRecord::Base.connection.reset_pk_sequence!("tester_devices")


bug_csv_data = File.read(Rails.root.join("db", "data", "bugs.csv"))
bug_data_without_headers = CSV.parse(bug_csv_data).drop(1)
bug_data_without_headers.each do |device_data|
  id, device_id, tester_id = device_data

  Bug.create! do |bug|
    bug.id = id
    bug.device_id = device_id
    bug.tester_id = tester_id
  end
end

ActiveRecord::Base.connection.reset_pk_sequence!("bugs")


puts "Done!"
