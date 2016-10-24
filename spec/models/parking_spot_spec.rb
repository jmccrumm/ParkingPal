require 'rails_helper'
require 'byebug'
require 'rspec/its'

RSpec.describe Parkingspot, type: :model do
  #it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:status) }

  describe 'Taken spot' do
  	it 'should have a person occupying it' do
  		its(:occupying) {should != nil}
  	end
  end
end

