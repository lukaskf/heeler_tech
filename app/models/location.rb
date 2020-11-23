class Location < ApplicationRecord
    has_many :workorders, foreign_key: "location_id"
end
