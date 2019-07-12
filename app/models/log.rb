class Log < ApplicationRecord
  belongs_to :person
  belongs_to :history

  validates_presence_of :person, :history, :past_status, :current_status
end
