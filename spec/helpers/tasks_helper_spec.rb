require 'rails_helper'

describe TasksHelper do
  describe '#human_boolean' do
    it { expect(helper.human_boolean(true)).to eq 'Yes' }
    it { expect(helper.human_boolean(false)).to eq 'No' }
  end
end
