module HistoriesHelper
  def status_button_text(status)
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
