require 'rails_helper'
describe Employee do
  describe '#name' do
    record = Employee.new
    it 'fails if the name is nil' do
      record.name = ''
      record.valid?
      expect(record.errors[:name]).to include("can't be blank")
    end

    it 'name is too short' do
      record.name = 'qw'
      record.valid?
      expect(record.errors[:name]).to include('is too short (minimum is 3 characters)')
    end

    it 'name is too long' do
      record.name = 'qwertyuiopqwe'
      record.valid?
      expect(record.errors[:name]).to include('is too long (maximum is 10 characters)')
    end
  end
end
