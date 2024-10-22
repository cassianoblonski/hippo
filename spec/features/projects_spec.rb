# frozen_string_literal: true

require 'rails_helper'

describe 'Project', type: :feature do
  let!(:person) { create_logged_in_person }
  let!(:project) { create(:project, manager: person) }

  before do
    visit "/projects"
  end

  describe 'index' do
    it 'finds card with project info' do
      expect(page).to have_text('Hippo') &
                      have_text('Managed by:') &
                      have_text(project.manager.name)
    end
  end

  describe 'create' do
    it 'must have the form working' do
      click_link('Create Project')
      fill_in 'Name', with: 'Hippo'
      click_button('Create Project')

      expect(page).to have_text('Hippo')
    end
  end

  describe 'edit' do
    it 'must have the form working' do
      visit "/projects/#{project.id}/edit"
      fill_in 'Name', with: 'Hippo v2'
      click_button('Update Project')

      expect(page).to have_text('Hippo v2')
    end
  end

  describe 'show' do
    it 'must have project information' do
      visit "/projects/#{project.id}"

      expect(page).to have_text(project.name) &
                      have_text(project.manager.name) &
                      have_link("Edit Project") &
                      have_link("Back")
    end
  end
end
