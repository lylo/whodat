require 'trello'

Trello.configure do |config|
  config.developer_public_key = Rails.application.credentials.trello[:api_key]
  config.member_token = Rails.application.credentials.trello[:token]
end
