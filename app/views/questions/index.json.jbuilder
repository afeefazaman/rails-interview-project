json.array! @questions do |question|
  json.id question.id
  json.title question.title
  json.asker question.asker_name

  json.answers question.answers do |answer|
    json.body answer.body
    json.provider answer.provider_name
  end
end
