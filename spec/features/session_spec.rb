# frozen_string_literal: true

require 'rails_helper'

describe 'Session', type: :feature do
  before do
    visit '/'
  end

  describe 'sign up' do
    it 'must have form working' do
      click_link 'Sign up'
      fill_in 'Name', with: 'Foo Bar'
      fill_in 'Email', with: 'foo_bar@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_text('Welcome! You have signed up successfully.') &
                      have_link('Foo Bar') &
                      have_text('Logout')
    end
  end

  describe 'login' do
    let!(:person) { create(:person) }

    it 'successfully' do
      fill_in 'Email', with: person.email
      fill_in 'Password', with: 'password'
      click_button 'Login'

      expect(page).to have_text('Signed in successfully.') &
                      have_link(person.name)
    end

    it 'with wrong information' do
      fill_in 'Email', with: person.email
      fill_in 'Password', with: 'wrong-password'
      click_button 'Login'

      expect(page).to have_text('Invalid Email or password.')
    end
  end
end
