class History < ApplicationRecord
  extend Enumerize

  enumerize :status, in: [:pending, :started, :delivered, :accepted]

  belongs_to :project
  belongs_to :requester, class_name: "Person"
  belongs_to :owner, class_name: "Person", optional: true
  has_many :tasks

  validates_presence_of :name, :status

end
