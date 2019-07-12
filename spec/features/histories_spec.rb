# frozen_string_literal: true

require 'rails_helper'

describe 'History', type: :feature do
  let!(:person) { create_logged_in_person }
  let!(:project) { create(:project) }
  let!(:pending_history) { create(:history, project: project) }
  let!(:started_history) { create(:history, :started, project: project) }
  let!(:delivered_history) { create(:history, :delivered, project: project) }
  let!(:accepted_history) { create(:history, :accepted, project: project) }

  before do
    visit "/projects/#{project.id}/histories"
  end

  describe 'Task Board' do
    it 'finds project title' do
      within '.project-histories-header' do
        expect(page).to have_text(project.name) &
                        have_link("New History")
      end
    end

    it 'finds boards' do
      within '.card-deck' do
        expect(page).to have_text('To Do') &
                        have_text('Doing') &
                        have_text('Done')
      end
    end

    it 'finds to-do card histories' do
      within '.to-do' do
        expect(page).to have_text(pending_history.points) &
                        have_text(pending_history.name) &
                        have_link('start') &
                        have_text(pending_history.description)
      end
    end

    it 'finds doing card histories' do
      within '.doing' do
        expect(page).to have_text(started_history.points) &
                        have_text(started_history.name) &
                        have_link('finish') &
                        have_text(started_history.description)
      end
    end

    it 'finds done card histories' do
      within '.done' do
        expect(page).to have_text(delivered_history.points) &
                        have_text(delivered_history.name) &
                        have_link('accept') &
                        have_text(delivered_history.description) &
                        have_text(accepted_history.points) &
                        have_text(accepted_history.name) &
                        have_text('accepted') &
                        have_text(accepted_history.description)
      end
    end
  end

  describe 'create' do
    it 'must have form working' do
      click_link 'New History'
      fill_in 'Name', with: 'Project 1'
      find('#history_requester_id').find(:option, person.name).select_option
      find('#history_owner_id').find(:option, person.name).select_option
      fill_in 'Description', with: 'Description Text'
      find('#history_points').find(:option, 3).select_option
      click_button 'Create History'

      expect(page).to have_text('History was successfully created.') &
                      have_css('.to-do', text: 3) &
                      have_css('.to-do', text: 'Project 1') &
                      have_css('.to-do', text: 'start') &
                      have_css('.to-do', text: 'Description Text')
    end
  end

  describe 'edit' do
    it 'must have the form working' do
      visit "/projects/#{project.id}/histories/#{pending_history.id}/edit"
      fill_in 'Name', with: 'Project v2'
      find('#history_points').find(:option, 8).select_option

      click_button('Update History')

      expect(page).to have_text('Project v2') &
                      have_text('8')
    end
  end

  describe 'change status' do
    context 'pending history' do
      it 'changes to started' do
        within '.to-do' do
          click_link 'start'
        end
        within '.doing' do
          expect(page).to have_link(pending_history.name)
        end
      end
    end

    context 'started_history' do
      it 'changes to delivered' do
        within '.doing' do
          click_link 'finish'
        end
        within '.done' do
          expect(page).to have_link(started_history.name)
        end
      end
    end

    context 'delivered_history' do
      it 'changes to accepted' do
        within '.done' do
          click_link 'accept'
          expect(page).to have_link(delivered_history.name)
        end
      end
    end

    context 'accepted_history' do
      it 'must not find a link' do
        within '.done' do
          click_link 'accept'
          expect(page).to have_no_link('accepted')
        end
      end
    end
  end

   describe 'reset_status' do
    it 'changes back to pending' do
      click_link('Back to pending',
                  href: "/projects/#{project.id}/histories/#{started_history.id}/reset_status")
      visit "/projects/#{project.id}/histories/#{started_history.id}"
      expect(page).to have_text('pending')
    end
  end

  describe 'history log' do
    context 'when changing to next status' do
      it 'creates a log entry' do
        click_link('start',
                    href: "/projects/#{project.id}/histories/#{pending_history.id}/next_status")
        visit "/projects/#{project.id}/histories/#{pending_history.id}"

        expect(page).to have_text('started') &
                        have_text("#{person.name} changed this history status from pending to started")
      end
    end


    context 'when changing to next status' do
      it 'creates a log entry' do
        click_link('Back to pending',
                      href: "/projects/#{project.id}/histories/#{started_history.id}/reset_status")
        visit "/projects/#{project.id}/histories/#{started_history.id}"

        expect(page).to have_text('started') &
                        have_text("#{person.name} changed this history status from started to pending")
      end
    end
  end
end
