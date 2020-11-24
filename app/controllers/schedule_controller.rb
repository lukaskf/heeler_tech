class ScheduleController < ApplicationController
    def index
        @technicians = Technician.all
        @locations = Location.all
        @workorders = Workorder.all

        @todays_date = "10/1/19"

        def find_workorder(i)
            current_time = Time.parse("#{todays_date} #{i}:00")
            workorder = technician.workorders.find_by time: "#{@todays_date} "
        end
    end
end
