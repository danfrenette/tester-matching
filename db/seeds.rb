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

puts "Done!"
