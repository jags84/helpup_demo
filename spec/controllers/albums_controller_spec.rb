require 'rails_helper'
require 'devise'

RSpec.describe AlbumsController, type: :controller do
  include Devise::Test::ControllerHelpers
  login_user

  describe "GET #index" do
    it "assigns all albums as @albums" do
      album = FactoryGirl.create_list(:album,1,user: subject.current_user)
      get :index, params: {}
      expect(assigns(:albums)).to eq(album)
    end
  end

  describe "GET #show" do
    it "assigns the requested album as @album" do
      album = FactoryGirl.create(:album,user:subject.current_user)
      get :show, params: {id: album.to_param}
      expect(assigns(:album)).to eq(album)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Album" do
        album = FactoryGirl.build(:album)
        expect {
          post :create, params: {album: {title: 'Title' , user: subject.current_user}}
        }.to change(Album, :count).by(1)
      end

      it "assigns a newly created album as @album" do
        album = FactoryGirl.build(:album)
        post :create, params: {album: {title: 'Title' , user: subject.current_user}}
        expect(assigns(:album)).to be_a(Album)
        expect(assigns(:album)).to be_persisted
      end

      it "redirects to the created album" do
        album = FactoryGirl.build(:album)
        post :create, params: {album: {title: 'Title' , user: subject.current_user}}
        expect(response).to redirect_to(Album.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved album as @album" do
        album = FactoryGirl.build(:album)
        post :create, params: {album: {user: subject.current_user}}
        expect(assigns(:album)).to be_a_new(Album)
      end

      it "re-renders the 'index' template" do
        album = FactoryGirl.build(:album)
        post :create, params: {album: {user: subject.current_user}}
        expect(response).to render_template("index")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the requested album" do
        album = FactoryGirl.create(:album, user:subject.current_user)
        album.title = "New Updated Title"
        put :update, params: {id: album.id, album: {title: album.title, private: false}}
        album.reload
        expect(album.title).to eq("New Updated Title")
      end

      it "redirects to the album" do
        album = FactoryGirl.create(:album)
        put :update, params: {id: album.id, album: {title: "New Updated Title"}}
        album.reload
        expect(response).to redirect_to(album)
      end
    end
  end

end
