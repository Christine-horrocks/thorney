module ListDescriptionHelper
  # Helper method to create hash for a ListDescriptionComponentSerializer item
  def create_description_list_item(term, descriptions, time: nil)
    return if descriptions.all?(&:blank?)

    {}.tap do |hash|
      hash[:term] = { content: term }
      hash[:description] = descriptions.map { |description| { content: description } } unless time
      hash[:description] = descriptions.map { |description| description } if time
    end
  end
end
