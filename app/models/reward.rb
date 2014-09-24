class Reward < ActiveRecord::Base
  belongs_to :project

  # validates :description, presence: true
  # validates :amount, presence: true, numericality: true
end
