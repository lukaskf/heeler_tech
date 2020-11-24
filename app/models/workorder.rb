class Workorder < ApplicationRecord
    belongs_to :technician, class_name: "Technician"
    belongs_to :location, class_name: "Location"
    validates :time, uniqueness: {scope: [:technician_id, :location_id]}
end
