# give yourself access to Ruby's CSV class
require 'csv'

# write your task that loops through the csv file line-by-line
namespace :db do
  desc "Populate Customers data from CSV file"

  task populate_customers: :environment do

    source_file = Rails.root.join('lib', 'tasks', 'data', 'Customers.csv')

      CSV.foreach(source_file, headers: true).each do |row| #each row in the database/csv file
        # NOT sure why there's an error
        customer = Customer.create!(row.to_h) #to covert to a hash
        puts customer.company #company is a property of customer; printing out customer namesla

      end

  end
end
