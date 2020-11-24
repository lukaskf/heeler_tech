class Location < ApplicationRecord
    has_many :workorders, foreign_key: "location_id"
    validates :name, uniqueness: {scope: :city, case_sensitive: false}
end
