require 'rails_helper'

RSpec.describe Log, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:person) }
    it { is_expected.to belong_to(:history) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :person }
    it { is_expected.to validate_presence_of :history }
    it { is_expected.to validate_presence_of :past_status }
    it { is_expected.to validate_presence_of :current_status }
  end
end
