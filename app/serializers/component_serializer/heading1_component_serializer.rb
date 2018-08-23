module ComponentSerializer
  class Heading1ComponentSerializer < ComponentSerializer::BaseComponentSerializer
    # Initialise a heading1 component.
    #
    # @param [String] subheading_content content of the subheading, this could be a string or a translation key.
    # @param [String] subheading_data data for the subheading, for example this could be an integer or url which can be passed into a translation in the front end.
    # @param [String] heading_content content of the heading, this could be a string or a translation key.
    # @param [String] heading_data data for the heading, for example this could be an integer or url which can be passed into a translation in the front end.
    # @param [String] context_content content of the context, this could be a string or a translation key.
    # @param [String] context_data data for the context, for example this could be an integer or url which can be passed into a translation in the front end.
    # @param [Boolean] context_hidden this boolean indicated if the context is only avalibale to screen readers.
    #
    # @example Initialising a heading1 component with content
    #   ComponentSerializer::Heading1ComponentSerializer.new(subheading_content: 'string or translation key', subheading_data: {"link": 'link.com'}, heading_content: 'string or translation key', heading_data: {"link": 'link.com'}, context_content: 'string or translation key', context_data: {"link": 'link.com'}, context_hidden: true).to_h
    def initialize(subheading_content: nil, subheading_data: nil, heading_content: nil, heading_data: nil, context_content: nil, context_data: nil, context_hidden: nil)
      @subheading_content = subheading_content
      @subheading_data = subheading_data
      @heading_content = heading_content
      @heading_data = heading_data
      @context_content = context_content
      @context_data = context_data
      @context_hidden = context_hidden
    end

    private

    def name
      'heading1'
    end

    def data
      {}.tap do |hash|
        hash[:subheading] = subheading if @subheading_content || @subheading_data
        hash[:heading] = heading if @heading_content || @heading_data
        hash[:context] = context if @context_content || @context_data
      end
    end

    def subheading
      {}.tap do |hash|
        hash[:content] = @subheading_content if @subheading_content
        hash[:data] = @subheading_data if @subheading_data
      end
    end

    def heading
      {}.tap do |hash|
        hash[:content] = @heading_content if @heading_content
        hash[:data] = @heading_data if @heading_data
      end
    end

    def context
      {}.tap do |hash|
        hash[:content] = @context_content if @context_content
        hash[:data] = @context_data if @context_data
        hash[:hidden] = @context_hidden if @context_hidden
      end
    end
  end
end
