require 'rails_helper'
require 'byebug'
require 'rspec/its'

RSpec.describe Parkingspot, type: :model do

  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:id) }

  describe 'Taken spot', 'Reserved spot' do
	its(:occupying) {should_not == nil}


  	context 'User holding spot is logged in user' do
  		let(:spot) {FactoryGirl.create :parkingspot}
  		let(:occupying) {Type.find spot.occupying}
  		let(:user) {FactoryGirl.create :user}

  		it 'recognize logged in user has the spot' do
  			expect(spot.occupying).to eq(user.id)
  		end
  	end
  end

  describe 'Open spot' do
	its(:occupying) {should == nil}
	its(:status) {should == 'open'}

	context 'User is already holding a spot elsewhere' do
		let(:user) {FactoryGirl.create :user}

		it 'cannot take multiple spots' do

		end
	end

  end

end

