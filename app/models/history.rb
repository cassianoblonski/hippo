class History < ApplicationRecord
  enum status: [:pending, :started, :delivered, :accepted]

  belongs_to :project
  belongs_to :requester, class_name: "Person"
  belongs_to :owner, class_name: "Person", optional: true
  has_many :tasks

  validates_presence_of :name, :status, :requester

  scope :to_do,   -> { where(status: 0) }
  scope :doing,   -> { where(status: 1) }
  scope :done, -> { where(status: 2).or(where(status: 3)) }

  def self.points_scale
    [1, 2, 3, 5, 8, 13]
  end

  def increment_status
    History.statuses[status]+1
  end

  def status_button_text
    case status
    when 'pending'
      'start'
    when 'started'
      'finish'
    when 'delivered'
      'accept'
    else
      'accepted'
    end
  end
end
