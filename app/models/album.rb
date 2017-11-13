class Album < ApplicationRecord
  belongs_to :user
  has_many :pictures
  validates :title, presence: true

  def is_empty?
    self.pictures.length == 0 ? true : false
  end

  def album_cover
    if self.is_empty?
      ActionController::Base.helpers.asset_path("empty_album.png")
    else
      self.pictures.first.photo.url
    end
  end

  def is_private?
    self.private
  end

  private
    def album_params
      params.require(:album).permit(:title,:private)
    end
  
end
