class Project < ActiveRecord::Base
  belongs_to :user
  has_many :donations
  has_many :backers, through: :donations
  
  has_many :rewards

  accepts_nested_attributes_for :rewards

  # validates :name, presence: true, uniqueness: true
  # validates :description, presence: true
  # validates :goal, presence: true, numericality: true
  # validates :start_date, presence: true
end
