class Technician < ApplicationRecord
    has_many :workorders, foreign_key: "technician_id"
    validates :name, uniqueness: {case_sensisitve: false}
end
