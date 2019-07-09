require 'rails_helper'

RSpec.describe Person, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  # or with RSpec 3 expect syntax
  it { is_expected.to enumerize(:sex) }
end
