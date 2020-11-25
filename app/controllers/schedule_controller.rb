class ScheduleController < ApplicationController
    helper_method :start_time
    helper_method :end_time
    def index
        @technicians = Technician.all
        @workorders = Workorder.all

        @todays_date = DateTime.parse('20191001 6: 00: 00')
    end
    def get_holder_entries(occupied_times)
        holders = []
        occupied_times.each_with_index do |block, index|
            if index==0 && block[:start_time]!=6 #first workorder doesn't start at first slot
                holders.append({"start_time": 6, "end_time": block[:start_time]})
            elsif index==occupied_times.length-1 && block[:end_time]!=18 #last workorder doesn't end at last slot
                holders.append({"start_time": block[:end_time], "end_time": 18})
            elsif index!=occupied_times.length-1 #put holder that starts at end of current workorder, and ends at the start of the next workorder
                holders.append({"start_time": block[:end_time], "end_time": occupied_times[index+1][:start_time]})
            end
        end
        return occupied_times
    end
end
