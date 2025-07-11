require 'rails_helper'
# require 'cancan/matchers'

# RSpec.describe User do
# subject(:user) { create(:user) }

# describe 'validations' do
#     it { is_expected.to validate_presence_of(:email) }
#     it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
#     it { is_expected.not_to allow_value('user').for(:email) }
#     it { is_expected.to allow_value('1234567890').for(:password) }
#   end
# end

# spec/models/user_spec.rb

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { described_class.new } # Definición correcta del sujeto de prueba

    it 'validar presencia de datos' do
      expect(user).to validate_presence_of(:email)
    end

    it 'validates email format' do
      # Testea formato de email (Devise ya valida presencia y unicidad)
      expect(build(:user, email: 'invalid')).not_to be_valid
      expect(build(:user, email: 'valid@example.com')).to be_valid
    end

    it 'validates password length' do
      # Testea longitud mínima (Devise requiere >= 6 caracteres)
      expect(build(:user, password: '12345')).not_to be_valid
      expect(build(:user, password: '123456')).to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:tasks) }
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end

  describe 'when task mark_as_completed!' do
    it 'updates completed status' do
      task = create(:task, completed: false)
      task.mark_as_completed!
      expect(task.completed).to be true
    end
  end
end
