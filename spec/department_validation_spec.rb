require 'rails_helper'
describe Department do
  describe '#name' do
    record = Department.new
    it 'fails if the name is nil' do
      record.name = ''
      record.valid?
      expect(record.errors[:name]).to include("can't be blank")
    end

    it "fails if the name isn't unique" do
      Department.create(name: 'Developer')
      record.name = 'Developer'
      record.save
      record.valid?
      expect(record.errors[:name]).to include('has already been taken')
    end

    it 'allows only letters in name' do
      record.name = '123'
      record.save
      record.valid?
      expect(record.errors[:name]).to include("only allows letters for department's name")
    end
  end
end
