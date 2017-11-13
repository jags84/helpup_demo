FactoryGirl.define do
  factory :picture do
    album
    photo { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'empty_album.png'), 'image/png') }
  end
end
