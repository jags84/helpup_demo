require 'rails_helper'
require 'devise'
RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe PicturesController, type: :controller do
  include Devise::Test::ControllerHelpers
  login_user

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Picture" do
        album = FactoryGirl.create(:album, user:subject.current_user)
        photo = Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'empty_album.png'), 'image/png')
        expect {
          post :create, params: {file: photo, album_id: album.id}
        }.to change(Picture, :count).by(1)
      end
    end
    context "with invalid params" do
      it "doesn't create a new Picture" do
        album = FactoryGirl.create(:album, user:subject.current_user)
        photo = nil
        expect {
          post :create, params: {file: photo, album_id: album.id}
        }.to raise_error
      end
    end
  end
end
