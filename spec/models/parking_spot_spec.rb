require 'rails_helper'
require 'byebug'
require 'rspec/its'

RSpec.describe Parkingspot, type: :model do

  it { is_expected.to validate_presence_of(:status) }

  describe 'Taken spot', 'Reserved spot' do
	its(:occupying) {should_not == nil}


  	context 'User holding spot is logged in user' do
  		let(:user) {FactoryGirl.build :user}
  		let(:spot) {FactoryGirl.build :parkingspot, :occupying => user.id }

  		it 'recognize logged in user has the spot' do
  			expect(spot.occupying).to eq(user.id)
  		end

  		it 'user is marked as being parked' do
  			expect(user.is_parked).to eq(true)
  		end
  	end
  end

  describe 'Open spot' do
	its(:occupying) {should == nil}
	its(:status) {should == 'open'}

	context 'User is already holding a spot elsewhere' do
		let(:user) {FactoryGirl.build :user, :is_parked => true}
		let(:spot) {FactoryGirl.build :parkingspot, :status => 'open' }

		it 'cannot take multiple spots' do
			expect(spot.occupying).to eq(nil)
		end
	end

  end

  describe 'Handicap spot' do
  	context 'Spot is not empty' do
  		let(:user) {FactoryGirl.build :user}
  		let(:spot) {FactoryGirl.build :parkingspot, :status => 'taken', 
  			:occupying => user.id, :spot_type => 'handicap'}

  		it 'User holding spot needs to be handicap' do
  			expect(user.is_handicap).to eq(true)
  		end
  	end

  end

end

