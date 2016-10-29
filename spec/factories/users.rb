FactoryGirl.define do
  factory :user do
  	id '1'
    name 'User'
    LPN 'AAA-111'
    email 'user@email.com'
    password 'password'
    is_handicap false
    is_parked false
  end
end
