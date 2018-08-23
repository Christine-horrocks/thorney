module ComponentSerializer
  class CardComponentSerializer < ComponentSerializer::BaseComponentSerializer
    # Initialise a card component.
    #
    # @param [String] name name of the card.
    # @param [Hash] data data of the card.
    #
    # @example Initialising a card component
    #   ComponentSerializer::CardComponentSerializer.new('card__generic', {card_type: 'small', heading: ComponentSerializer::HeadingComponentSerializer.new('See heading for arguments'), paragraph: ComponentSerializer::ParagraphComponentSerializer.new('See paragraph for arguments'), figure: ComponentSerializer::FigureComponentSerializer.new('See figure for arguments'), link_button: ComponentSerializer::LinkButtonComponentSerializer.new('See link button for arguments'), count: ComponentSerializer::CountComponentSerializer.new('See count for arguments')}).to_h
    def initialize(name, data)
      @name = name
      @data = data
    end

    private

    attr_reader :name, :data
  end
end
