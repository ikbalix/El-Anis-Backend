class Volunteer < ApplicationRecord
    belongs_to :volunteer, class_name: "User", foreign_key: "volunteer_id"
    belongs_to :user
end
