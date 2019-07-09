class Person < ApplicationRecord
  has_many :managed_projects, class_name: 'Project', foreign_key: :manager_id
  has_many :requested_histories, class_name: 'History', foreign_key: :requester_id
  has_many :owned_histories, class_name: 'History', foreign_key: :owner_id

  validates_presence_of :name, :email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
