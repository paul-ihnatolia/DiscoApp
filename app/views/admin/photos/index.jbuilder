json.photos @photos.each do |photo|
  json.id photo.id
  json.is_cover photo.is_cover
  json.photo_url photo.content.url
end