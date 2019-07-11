require 'rails_helper'

RSpec.describe History, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to belong_to(:requester).class_name('Person') }
    it { is_expected.to belong_to(:owner).class_name('Person').optional }
    it { is_expected.to have_many(:tasks) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name}
    it { is_expected.to validate_presence_of :requester }
  end

  describe "status" do
    it { is_expected.to define_enum_for(:status).with_values %i( pending started delivered accepted ) }
  end

  describe '#points_scale' do
    it 'returns array with 1,2,3,5,8,13' do
      expect(History.points_scale).to eq([1, 2, 3, 5, 8, 13])
    end
  end

  describe '#increment_status' do
    let(:history) { create(:history, :started) }

    it 'returns next status' do
      expect(history.increment_status).to eql(2)
    end
  end
end
