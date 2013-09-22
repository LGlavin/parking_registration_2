require 'spec_helper'

features "user registers parking spot", %Q {
 as a parker
 I want to register my spot with my name
 So that the parking company can identify my car


} do

  scenario 'specifies valid information, registers spot' do
    prev_count = ParkingRegistration.count
    visit '/'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Spot_number', with: 5
    click_button 'Register'
    expect(page).to have_content('You registered succesfully')
    expect(ParkingRegistration.count).to eql(prev_count + 1)
  end