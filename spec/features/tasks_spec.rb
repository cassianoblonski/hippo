# frozen_string_literal: true

require 'rails_helper'

describe 'Task', type: :feature do
  let!(:person) { create_logged_in_person }
  let!(:project) { create(:project) }
  let!(:history) { create(:history, project: project) }
  let!(:task) { create(:task, history: history) }

  before do
    visit "projects/#{project.id}/histories/#{history.id}"
  end


  describe 'new task' do
    it 'must have form working' do
      click_link 'New Task'
      fill_in 'Description', with: 'Change logo'
      click_button 'Create Task'

      expect(page).to have_text('Task was successfully created.') &
                      have_text('Change logo')
    end
  end

  describe 'index' do
    context 'on history show' do
      it 'finds tasks info' do
        expect(page).to have_link(task.description)
      end
    end
  end

  describe 'check task done', js: true do
    it 'changes to yes' do
      check("task-checkbox-#{task.id}")
      click_link task.description

      expect(page).to have_text('Yes')
    end
  end
end
