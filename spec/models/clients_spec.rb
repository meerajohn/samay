require 'spec_helper'

describe Client do
  it 'should have a code' do
    build(:client, code: nil).should_not be_valid
  end

  it 'should have a name' do
    build(:client, name: nil).should_not be_valid
  end

  it 'should not allow duplicate code' do
    create(:client, code: '1001')
    build(:client, code: '1001').should_not be_valid
  end

  it 'should not allow duplicate name' do
    create(:client, name: 'Austen')
    build(:client, name: 'Austen').should_not be_valid
  end

  it 'should have a contact' do
    build(:client, contact: nil).should_not be_valid
  end
end
