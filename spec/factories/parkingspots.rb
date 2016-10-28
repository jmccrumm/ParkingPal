FactoryGirl.define do
  factory :parkingspot do
  	parkinglot_id '1'
    status 'open'
    occupying nil
    spot_type 'normal'

    trait :empty do
    	status 'open'
    	occupying nil
    end
  end
end
