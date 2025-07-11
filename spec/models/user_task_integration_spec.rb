require 'rails_helper'

RSpec.describe User, type: :model do

    describe 'user-tasks relationship' do
        let(:user) { create(:user) }
        let!(:task) { create(:task, user: user) }
    
        it 'destroys tasks when user is destroyed' do
            expect { user.destroy }.to change(Task, :count).by(-1)
        end
    
        it 'allows users to have multiple tasks' do
            create(:task, user: user)
            expect(user.tasks.count).to eq(2)
        end
    end
    describe 'task completion status' do
        let(:user) { create(:user) }
      
        it 'tracks completion status correctly' do
          task = create(:task, user: user, completed: false)
          task.update(completed: true)
          expect(user.tasks.completed).to include(task)
        end
      end
end