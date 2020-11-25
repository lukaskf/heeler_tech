namespace :import_csv do
    desc "Imports data from CSV to App & DB"    
    task import_technicians: :environment do
        puts "Importing Technicians Data..."
        filename = File.join Rails.root, "lib/assets/technicians.csv"
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
        filename = File.join Rails.root, "lib/assets/locations.csv"
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
        filename = File.join Rails.root, "lib/assets/work_orders.csv"
        counter = 0

        def parse_date(date)
            # Parses from "10/1/19 6:00" form to be able to do have DateTime parse correctly into DB: DateTime.parse('20191001 6: 00: 00')
            date = date.strip
            date_time = date.split(" ")
            m_d_y = date_time[0].split("/")
            h_m = date_time[1].split(":")

            month = m_d_y[0]
            day = m_d_y[1]
            year = m_d_y[2]
            
            date_string = "20#{year}#{Integer(month)<10 ? "0"+month : month}#{Integer(day)<10 ? "0"+day : day}"
            time_string = "#{h_m[0]}: #{h_m[1]}: 00"
            result = date_string + " " + time_string
            return result
        end

        CSV.foreach(filename, headers:true) do |row|
            workorder = Workorder.create(technician_id: row["technician_id"], location_id: row["location_id"], time: parse_date(row["time"]), duration: row["duration"], price: row["price"])
            puts "Workorder at time:#{row["time"]} - #{workorder.errors.full_messages.join(",")}" if workorder.errors.any?
            counter +=1 if workorder.persisted?
        end

        puts "Successfully imported #{counter} workorders"
    end
end