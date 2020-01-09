# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

def rnd_str
  (0...8).map { rand(97..122).chr }.join.capitalize
end

fname = rnd_str

feature 'User signs up and logs in' do
  
  scenario 'user can create an account using the signup form' do
    visit '/users/sign_up'
    fill_in 'First name', with: fname
    fill_in 'Last name', with: rnd_str
    fill_in 'Email', with: "#{fname}@test.com"
    fill_in 'Password', with: 'foobar'
    fill_in 'Password confirmation', with: 'foobar'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully')
  end

  scenario 'user can log in using the log in form' do
    visit '/users/sign_in'
    fill_in 'Email', with: "#{fname}@test.com"
    fill_in 'Password', with: 'foobar'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    click_link 'Sign Out'
  end
  

end
