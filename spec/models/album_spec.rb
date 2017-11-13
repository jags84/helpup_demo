require 'rails_helper'

RSpec.describe Album, type: :model do
  subject {
    described_class.new(title: "Album Title", user: FactoryGirl.create(:user))
  }
  describe "Record Validations" do
    it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

    it "is not valid without a Title" do
      subject.title = ""
      expect(subject).to_not be_valid
    end

    it "is not valid without a User" do
      subject.user_id = ""
      expect(subject).to_not be_valid
    end
  end

  describe "Methods validations" do
    album = FactoryGirl.create(:album)
    
    it "return true if album is empty" do
      expect(album.is_empty?).to eq(true)
    end

    it "return true if album is private" do
      album.private = true
      expect(album.is_private?).to eq(true)
    end

    it "return false if album is public" do
      album.private = false
      expect(album.is_private?).to eq(false)
    end

    it "return false if album is not owned by a user" do
      user = FactoryGirl.create(:user)
      expect(Album.album_owner(album.id,user.id)).to eq(false)
    end

    it "return true if album is owned by a user" do
      expect(Album.album_owner(album.id,album.user)).to eq(true)
    end

    it "must return an album cover picture" do
      expect(album.album_cover).not_to be(nil)
    end


  end

end
