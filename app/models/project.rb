class Project < ApplicationRecord
  belongs_to :manager, class_name: "Person"
  has_many :histories

  validates_presence_of :name, :manager
end
