class ScheduleController < ApplicationController
    helper_method :get_workorder_entries
    def index
        @technicians = Technician.all

        @todays_date = "10/1/19"
    end
    def get_workorder_entries(technician)
        workorders = technician.workorders.where(date: @todays_date)
        workorder_entries = []
        workorders.each do |workorder|
            entry = {}
            entry["size"] = (workorder.duration/60).ceil()
            entry["position"] = workorder.time.to_s
            entry["info"] = "Location: #{workorder.location.name}, City: #{workorder.location.city}, Start-Time: #{workorder.time}, Price: #{workorder.price}"
            puts entry
            workorder_entries.append(entry)
        end
    end
end
