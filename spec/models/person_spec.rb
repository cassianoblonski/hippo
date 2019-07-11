require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:managed_projects).class_name('Project') }
    it { is_expected.to have_many(:requested_histories).class_name('History') }
    it { is_expected.to have_many(:owned_histories).class_name('History') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
  end
end
