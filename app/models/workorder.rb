class Workorder < ApplicationRecord
    belongs_to :technician, class_name: "Technician"
    belongs_to :location, class_name: "Location"
    validates :time, uniqueness: {scope: [:technician_id, :location_id]}

    def start_time
        return self.time.strftime("%H").to_i
    end 
    def end_time
       return self.start_time+(self.duration.to_f/60).ceil
    end
end
