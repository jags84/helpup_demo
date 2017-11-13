require 'rails_helper'

RSpec.describe Picture, type: :model do
  subject {
    described_class.new(photo: Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'empty_album.png'), 'image/png'), album: FactoryGirl.create(:album))
  }
  describe "Record Validations" do
    it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

    it "is not valid without a Photo" do
      subject.photo = ""
      expect(subject).to_not be_valid
    end

  end
end
