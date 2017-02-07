require 'rails_helper'

RSpec.describe Conference, type: :model do

  context '#validity' do
    it 'should have a title' do
      conference = build(:conference, :title => nil)
      expect(conference).not_to be_valid
    end

    it 'should have a location' do
      conference = build(:conference, :location => nil)
      expect(conference).not_to be_valid
    end

    it 'should have a starting date' do
      conference = build(:conference, :start_date => nil)
      expect(conference).not_to be_valid
    end
  end

end
