require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'When task is valid with valid attributes' do
    task = build(:task)
    expect(task).to be_valid
  end

  it 'When task is invalid without a title' do
    task = build(:task, title: nil)
    expect(task).not_to be_valid
  end

  it 'When titles longer than 100 characters' do
    task = build(:task, title: 'a' * 101)

    expect(task).not_to be_valid
    expect(task.errors[:title]).to include('is too long (maximum is 100 characters)')
  end

  it 'When description longer than 100 characters' do
    task = build(:task, description: 'a' * 1001)

    expect(task).not_to be_valid
    expect(task.errors[:description]).to include('is too long (maximum is 1000 characters)')
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '.completed' do
    it 'When task is complete' do
      completed_task = create(:task, completed: true)
      expect(described_class.completed).to eq([completed_task])
    end

    it 'When task is incomplete' do
      incomplete_task = create(:task, completed: false)
      expect(described_class.completed).not_to eq([incomplete_task])
    end

    it 'validate scope exist' do
      expect(described_class).to respond_to(:completed)
    end
  end
end
