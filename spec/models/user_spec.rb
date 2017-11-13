require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(email: "some@domain.com", name: "Juan", last_names: "Gonzalez", avatar: "SomeRandomURL", password: "123456", password_confirmation: "123456")
  }

  describe "Record Validations" do
    it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

    it "is not valid without an email" do
      subject.email = ""
      expect(subject).to_not be_valid
    end

    it "is valid without an name" do
      subject.name = ""
      expect(subject).to be_valid
    end

    it "is valid without an last_name" do
      subject.last_names = ""
      expect(subject).to be_valid
    end

    it "is valid without an avatar" do
      subject.avatar = ""
      expect(subject).to be_valid
    end
  end
end
