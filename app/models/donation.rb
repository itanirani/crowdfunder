class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :backer, class_name: "User"
end
