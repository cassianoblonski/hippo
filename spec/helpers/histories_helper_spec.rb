require 'rails_helper'

describe HistoriesHelper do
  describe '#status_button_text' do
    it { expect(helper.status_button_text('pending')).to   eq 'start' }
    it { expect(helper.status_button_text('started')).to   eq 'finish' }
    it { expect(helper.status_button_text('delivered')).to eq 'accept' }
    it { expect(helper.status_button_text('accepted')).to  eq 'accepted' }
  end
end
