class Workorder < ApplicationRecord
    belongs_to :technician, class_name: "Technician"
    belongs_to :location, class_name: "Location"
end
