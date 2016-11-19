require 'rails_helper'
require 'rspec/its'

RSpec.describe User, type: :model do

	it { is_expected.to validate_presence_of(:name) }
	it { is_expected.to validate_presence_of(:LPN) }
	#it { is_expected.to validate_format_of(:LPN) }
	it { is_expected.to validate_presence_of(:email) }
	it { is_expected.to validate_presence_of(:password) }

	its(:password) {is_expected.to be_greater_than(5)} 

	describe 'Non handicap user' do
		context 'user is parked' do 
			let(:user) {FactoryGirl.build :user, :is_parked => true, :is_handicap => false}
			let(:spot) {FactoryGirl.build :parkingspot, :spot_type => 'normal', :occupying => user.id }

			it 'spot cannot be handicap' do
				expect(spot.spot_type).to eq('normal')
			end

		end
	end


end
