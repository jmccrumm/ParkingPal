require 'rails_helper'
require 'byebug'
require 'rspec/its'

RSpec.describe Parkingspot, type: :model do

  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:id) }

  describe 'Taken spot', 'Reserved spot' do
  	context 'A user is registered to the spot' do
  		its(:occupying) {should_not == nil}
  		
  	end

  	context 'User holding spot is logged in user' do
  		let(:spotinfo) {FactoryGirl.create :spot}
  		let(:occupying) {Type.find spotinfo.occupying}
  		it 'should recognize logged in user has the spot' do
  			expect(spotinfo.occupying).to equal(user.id)
  		end
  	end
  end

  describe 'Open spot' do
	its(:occupying) {should == nil}

  end

end

