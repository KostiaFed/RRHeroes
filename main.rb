require 'telegram/bot'

TOKEN = '5501901022:AAHh76BZr6BYcX1A05axPKGbadYKmQjs9us'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
       bot.api.send_message(chat_id: message.chat.id, text: "Привіт, #{message.from.first_name}, розробка гри вже розпочалась!")
    end
  end
end
