class ScheduleController < ApplicationController
    helper_method :get_workorder_entries
    def index
        @technicians = Technician.all
        @workorders = Workorder.all

        @todays_date = DateTime.parse('20191001 6: 00: 00')
    end
    def get_workorder_entries()
        workorders = Workorders.all.where(date: @todays_date)
        @workorder_entries = []
        workorders.each do |workorder|
            entry["tech"] = "tech-#{workorder.technician_id}"
            entry["duration"] = (workorder.duration/60).ceil()
            entry["start_time"] = workorder.time.to_s
            entry["info"] = "Location: #{workorder.location.name}, City: #{workorder.location.city}, Start-Time: #{workorder.time}, Price: #{workorder.price}"
            puts entry
            workorder_entries.append(entry)
        end
    end
end
