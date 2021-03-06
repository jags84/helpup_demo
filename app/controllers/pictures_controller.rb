class PicturesController < ApplicationController
  before_action :authenticate_user!
  def create
    if Album.album_owner(params[:album_id],current_user)
      @picture = Picture.new()
      @picture.album_id = params[:album_id]
      @picture.photo = params[:file]

      if @picture.save!
        respond_to do |format|
          format.html {render :json => @picture.to_json, :content_type => 'text/html',:layout => false}
          format.json {render :json => @picture.to_json}
        end
      else 
        render :json => [{:error => "custom_failure"}], :status => 304
      end
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    render :json => true
  end
end
