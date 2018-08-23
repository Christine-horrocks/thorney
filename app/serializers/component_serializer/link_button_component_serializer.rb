module ComponentSerializer
  class LinkButtonComponentSerializer < BaseComponentSerializer
    # Initialise a count partial.
    #
    # @param [String] link URL or other link.
    # @param [String] text a string or translation key for the text on the button.
    # @param [Boolean] download a boolean to indicate if the button should lead to a download link.
    # @param [Array<Hash>] display_data used for the element's css.
    #
    # @example Initialising a link button partial
    #   ComponentSerializer::LinkButtonComponentSerializer.new(link: 'the link the button will take you to', text: 'text on the button', download: true, display_data: [display_data(component: 'type of component', variant: 'type of variant')]).to_h
    def initialize(link: nil, text: nil, download: nil, display_data: nil)
      @link = link
      @text = text
      @download = download
      @display_data = display_data
    end

    def name
      'partials__link-button'
    end

    def data
      {}.tap do |hash|
        hash[:link] = @link if @link
        hash[:text] = @text if @text
        hash[:download] = @download if @download
        hash[:display] = display_hash(@display_data) if @display_data
      end
    end
  end
end
