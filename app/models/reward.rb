class Reward < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  # validates :description, presence: true
  # validates :amount, presence: true, numericality: true
end
