require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:history) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :description}
    it { is_expected.to validate_presence_of :history }
  end
end
