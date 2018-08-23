module ComponentSerializer
  # Creates a description list using the array of objects passed to it.
  class ListDescriptionComponentSerializer < ComponentSerializer::BaseComponentSerializer
    # Initialise a list component with an array of objects.
    #
    # @param [Array<Hash>] items an array of objects.
    #
    # @example Creating a description list component
    #   ComponentSerializer::ListDescriptionComponentSerializer.new(items: [{ "term": { "content": "string or translation key" }, "description": [{ "content": "string, translation key, data" }] }, { "term": { "content": "string or translation key" }, "description": [{ "content": "string, translation key, data" }] }]).to_h
    #
    def initialize(items: nil)
      @items = items
    end

    private

    def name
      'list__description'
    end

    def data
      {}.tap do |hash|
        hash[:items] = @items if @items
      end
    end
  end
end
