require 'telegram/bot'

TOKEN = '5501901022:AAHh76BZr6BYcX1A05axPKGbadYKmQjs9us'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
       bot.api.send_message(chat_id: message.chat.id, text: "Привіт, #{message.from.first_name}, розробка гри вже розпочалась!")
    when '/photo'
      bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('001.png', 'image/png'))
    when '/info'
    file_path = "players_info"

    f = File.new(file_path, "r:UTF-8")
    lines = f.readlines
    File.open('players_info', 'a'){ |file| file.write 1 }

    bot.api.send_message(chat_id: message.chat.id, text: lines)
  end
end
end
