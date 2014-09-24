class Project < ActiveRecord::Base
  belongs_to :user
  has_many :donations
  has_many :backers, through: :donations
end
