class ScheduleController < ApplicationController
    helper_method :start_time
    helper_method :end_time
    def index
        @technicians = Technician.all
        @workorders = Workorder.all

        @todays_date = DateTime.parse('20191001 6: 00: 00').utc
        @end_of_day = @todays_date.utc + (12*60*60)
    end
end
