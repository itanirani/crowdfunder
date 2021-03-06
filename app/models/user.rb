class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :donations
  has_many :backed_projects, class_name: "Donation"
  has_many :rewards

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
