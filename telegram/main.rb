require File.expand_path('../config/environment', __dir__)
require 'telegram/bot'

TOKEN = '5501901022:AAHh76BZr6BYcX1A05axPKGbadYKmQjs9us'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|

  if !Player.exists?(telegram_id: message.from.id)
    player = Player.create(telegram_id: message.from.id, name: message.from.first_name)
  else
    player = Player.find_by(telegram_id: message.from.id)
  end

    case message.text
    when '/start'
       bot.api.send_message(chat_id: message.chat.id, text: "Привіт, #{message.from.first_name}, розробка гри вже розпочалась!")
    when '/photo'
      bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('001.png', 'image/png'))
    when '/info'
    bot.api.send_message(chat_id: message.chat.id, text: "111")
  end
end
end
