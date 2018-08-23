module ComponentSerializer
  class HeroComponentSerializer < BaseComponentSerializer
    # Initialise a hero component with an array of objects.
    #
    # @param [Array<Hash>] components an array of objects, each object is a component or partial.
    # @param [boolean] content_flag an optional parameter which adds a content-flag property to data.
    #
    # @example Initialising a hero component
    #   ComponentSerializer::HeroComponentSerializer.new([A_component_serializer, Another_component_serializer], content_flag: true).to_h
    def initialize(components, content_flag: nil)
      @components = components
      @content_flag = content_flag
    end

    def name
      'hero'
    end

    def data
      {}.tap do |hash|
        hash[:content_flag] = @content_flag if @content_flag
        hash[:components] = @components
      end
    end
  end
end
