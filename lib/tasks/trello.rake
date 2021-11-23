namespace :trello do
  WHOS_WHO = "Xau2Ttaq"

  task load_people: :environment do
    puts "Loading cards from Trello"
    lists = Trello::Board.find(WHOS_WHO).lists
    lists.each do |list|
      puts "Checking #{list.name}"
      cards = Trello::List.find(list.id).cards
      cards.each do |c|
        card = Trello::Card.find(c.id)
        person = Person.find_or_create_by!(trello_card_id: card.id)
        next if person.avatar.present?
        puts "checking #{card.name}"
        name, title = card.name.split /[\[(]/
        person.name = name.strip if name
        person.title = title.gsub(/[\)\]]/, "").strip if title
        person.team = list.name
        person.trello_created_at = card.created_at
        person.save!

        if card.cover_image && !card.cover_image.is_a?(Array)
          auth_header = "OAuth oauth_consumer_key=\"#{Rails.application.credentials.trello[:api_key]}\", oauth_token=\"#{Rails.application.credentials.
trello[:token]}\""
          image_io = Down::NetHttp.open(card.cover_image.url, headers: { "Authorization": auth_header })

          person.avatar.attach(io: image_io, filename: card.cover_image.file_name)
        end

        puts "Person #{person.name}, #{person.title}, #{person.team} updated"
      end
    end
  end
end
