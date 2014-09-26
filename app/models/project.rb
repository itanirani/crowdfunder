class Project < ActiveRecord::Base
  belongs_to :user
  has_many :donations
  has_many :backers, through: :donations
  
  has_many :rewards

  accepts_nested_attributes_for :rewards, :allow_destroy => true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/no_image.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # validates :name, presence: true, uniqueness: true
  # validates :description, presence: true
  # validates :goal, presence: true, numericality: true
  # validates :start_date, presence: true

  def distance_to_goal
  	goal - donations.sum(:amount)
  	# goal - donations.to_a.inject{|total, d| total += d.amount}
  end
end
