module ComponentSerializer
  class FigureComponentSerializer < BaseComponentSerializer
    # Initialise a figure partial.
    #
    # @param [Array<Hash>] display_data used for the element's css.
    # @param [String] link a URL or other link which the user will follow if they click on the figure.
    # @param [boolean] aria_hidden an optional parameter which adds a aria_hidden property to data.
    # @param [boolean] tab_index an optional parameter which adds a tab_index property to data.
    # @param [Array<Hash>] source_info is a hash containing the any source tag information, up to three key/value pairs. Including: media, srcset and additional srcset.
    # @param [Array<Hash>] img is a hash containing three key/value pairs to go in the img tag. One string of text or translation key for the alt label, one with any data from the backend to go in the alt label and the link for the src.
    # @param [Array<Hash>] figcap is a hash containing two key/value pairs. One for the content strign or translation key of the figure caption and one for any data it might need from the backend.
    #
    # @example Initialising a figure partial
    #   ComponentSerializer::FigureComponentSerializer.new(display_data: [display_data(component: 'type of component', variant: 'type of variant')], link: 'link.com', aria_hidden: true, tab_index: true, source_info: { source_media: '(size of image)', source_srcset: 'https://parliament.uk/photo and other things', source_srcset_2: 'https://yet-anotherphoto.com' }, img: { alt_text: 'text discribing image', alt_data: 'backend data to go in the alt text', source: 'https://and-yet-another-photo.uk' }, figcap: { figcap_content: 'text or translation key', figcap_data: 'backend data' }).to_h
    def initialize(display_data: nil, link: nil, aria_hidden: nil, tab_index: nil, source_info: nil, img: nil, figcap: nil)
      @display_data = display_data
      @link = link
      @aria_hidden = aria_hidden
      @tab_index = tab_index
      @source_info = source_info
      @img = img
      @figcap = figcap
    end

    def name
      'partials__figure'
    end

    def data
      [*base_hash, *extract_source_info, *extract_img, *extract_figcap].to_h
    end

    def base_hash
      {}.tap do |hash|
        hash[:display] = display_hash(@display_data) if @display_data
        hash[:link] = @link if @link
        hash[:aria_hidden] = @aria_hidden if @aria_hidden
        hash[:tab_index] = @tab_index if @tab_index
      end
    end

    def extract_source_info
      {}.tap do |hash|
        hash[:source_media] = @source_info[:source_media] if @source_info && @source_info[:source_media]
        hash[:source_srcset] = @source_info[:source_srcset] if @source_info && @source_info[:source_srcset]
        hash[:source_srcset_2] = @source_info[:source_srcset_2] if @source_info && @source_info[:source_srcset_2]
      end
    end

    def extract_img
      {}.tap do |hash|
        hash[:alt_text] = @img[:alt_text] if @img[:alt_text]
        hash[:alt_data] = @img[:alt_data] if @img[:alt_data]
        hash[:source] = @img[:source] if @img[:source]
      end
    end

    def extract_figcap
      {}.tap do |hash|
        hash[:figcap_content] = @figcap[:figcap_content] if @figcap && @figcap[:figcap_content]
        hash[:figcap_data] = @figcap[:figcap_data] if @figcap && @figcap[:figcap_data]
      end
    end
  end
end
