class Task < ApplicationRecord
  belongs_to :history

  validates_presence_of :description, :history

  scope :unfinished, -> { where(done: false) }
end
