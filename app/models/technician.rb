class Technician < ApplicationRecord
    has_many :workorders, foreign_key: "technician_id"
end
