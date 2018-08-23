module ComponentSerializer
  class SectionComponentSerializer < ComponentSerializer::BaseComponentSerializer
    # Initialise a section component with an array of objects.
    #
    # @param [Array<Hash>] components an array of objects, each object is a component or atom.
    # @param [String] type the type of section required - can be section or primary.
    # @param [boolean] content_flag an optional parameter which adds a content-flag property to data.
    # @param [Array<Hash>] display_data used for the element's css.
    #
    # @example Initialising a section section component
    #   ComponentSerializer::SectionComponentSerializer.new([A_component_serializer, Another_component_serializer], type: section, content_flag: true, display_data: [display_data(component: 'type of component', variant: 'variety of component')]).to_h
    # @example Initialising a section primary component
    #   ComponentSerializer::SectionComponentSerializer.new([A_component_serializer, Another_component_serializer], type: primary, content_flag: true).to_h
    def initialize(components, type: 'section', content_flag: nil, display_data: nil)
      @content_flag = content_flag
      @type = type
      @components = components
      @display_data = display_data
    end

    private

    def name
      "section__#{@type}"
    end

    def data
      {}.tap do |hash|
        hash[:content_flag] = @content_flag if @content_flag
        hash[:display] = display_hash(@display_data) if @display_data
        hash[:components] = @components
      end
    end
  end
end
