Feature: See list of open spots

Scenario: Attempting to look at a list of available spots and their location (id tag)
When: I am on parking stats and click 'available'
Then: I should get a list of open spots and click 'reserve spot' then park
