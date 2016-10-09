require 'rails_helper'

RSpec.describe Parkingspot, type: :model do
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:status) }
end
