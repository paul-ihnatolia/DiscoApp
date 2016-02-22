  json.id @event.id
  json.title @event.title
  json.event_date @event.event_date.strftime('')
  json.video_url @event.video_url
  json.is_prior @event.is_prior
  json.banner_url @event.banner.url