# frozen_string_literal: true

require 'rails_helper'

describe 'Person', type: :feature do
  let!(:person) { create_logged_in_person }

  before do
    visit "/people/#{person.id}"
  end

  describe 'show' do
    it 'finds person information' do
      within '.card-show-info' do
        expect(page).to have_text(person.name) &
                        have_text(person.email)
      end
    end

    it 'finds edit person' do
      within '.card-show-info' do
        expect(page).to have_link("Edit Person")
      end
    end
  end

  describe 'edit' do
    it 'must have the form working' do
      visit "/people/#{person.id}"
      click_link "Edit Person"
      fill_in 'Name', with: 'Foo Bar'
      fill_in 'Current password', with: 'password'
      click_button 'Update'

      expect(page).to have_text('Foo Bar') &
                      have_text('Your account has been updated successfully')
    end
  end
end
