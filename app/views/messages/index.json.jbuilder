if @new_message.present?
  json.array! @new_message.each do |new_message|
    json.content  new_message.content
    json.image  new_message.image.url
    json.video  new_message.video.url
    json.user_name  new_message.user.name
    json.time      new_message.created_at.strftime("%Y/%m/%d %H:%M")
    json.id  new_message.id
  end
end