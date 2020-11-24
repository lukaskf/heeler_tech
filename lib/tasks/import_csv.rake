namespace :import_csv do
    desc "Imports data from CSV to App & DB"    
    task import_technicians: :environment do
        puts "Importing Technicians Data..."
        filename = File.join Rails.root, "technicians.csv"
        counter = 0

        CSV.foreach(filename, headers:true) do |row|
            technician = Technician.create(name: row["name"])
            puts "#{row["name"]} - #{technician.errors.full_messages.join(",")}" if technician.errors.any?
            counter +=1 if technician.persisted?
        end

        puts "Successfully imported #{counter} technicians"
    end
    task import_locations: :environment do
        puts "Importing Locations Data..."
        filename = File.join Rails.root, "locations.csv"
        counter = 0

        CSV.foreach(filename, headers:true) do |row|
            location = Location.create(name: row["name"], city: row["city"])
            puts "#{row["name"]} - #{location.errors.full_messages.join(",")}" if location.errors.any?
            counter +=1 if location.persisted?
        end

        puts "Successfully imported #{counter} locations"
    end
    task import_workorders: :environment do
        puts "Importing Workorders Data..."
        filename = File.join Rails.root, "work_orders.csv"
        counter = 0

        CSV.foreach(filename, headers:true) do |row|
            date_time = row["time"].strip.split(" ")
            workorder = Workorder.create(technician_id: row["technician_id"], location_id: row["location_id"], date: date_time[0],time: date_time[1], duration: row["duration"], price: row["price"])
            puts "Workorder at time:#{row["time"]} - #{workorder.errors.full_messages.join(",")}" if workorder.errors.any?
            counter +=1 if workorder.persisted?
        end

        puts "Successfully imported #{counter} workorders"
    end
end