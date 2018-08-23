module ComponentSerializer
  class SearchFormComponentSerializer < ComponentSerializer::BaseComponentSerializer
    # Initialise a search form component.
    #
    # @param [String] query string to passed in as the value attribute of the input element.
    # @param [Array<Object>] components components that are intended to be part of the search form.
    # @param [Boolean] global a boolean to determine if the global tags are added in te dust file.
    #
    # @example Initialising a search form component
    #   ComponentSerializer::SearchFormComponentSerializer.new(query: nil (nil unless rendering a results page), components: [An_icon_componet], global: nil (only true if the search is being used as in a header)).to_h
    def initialize(query: nil, components: nil, global: nil)
      @query = query
      @components = components
      @global = global
    end

    private

    def name
      'form__search'
    end

    def data
      {}.tap do |hash|
        hash[:value] = @query if @query
        hash[:global] = @global if @global
        hash[:label] = 'search.label'
        hash[:components] = @components
      end
    end
  end
end
