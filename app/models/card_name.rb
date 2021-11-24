class CardName
  # Given a card name in the form "NAME [ROLE]", extracts the name
  # and title into separate variables
  #
  # Returns:
  #   - String: name
  #   - String: title
  def self.name_and_title(card_name)
    name, title = card_name.split("[")
    name = name.strip if name
    title = title.gsub("]", "").strip if title

    return name, title
  end
end
