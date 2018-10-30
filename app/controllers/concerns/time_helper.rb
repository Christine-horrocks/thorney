module TimeHelper
  # Extracts and organises the dates of an item which can respond to start_date and end_date into a structure which a paragraph serializer can use as content.
  #
  # @param [Object] :item the item (such as a group) which responds to start_date and end_date.
  #
  # @return [Object] a hash arranged to be used in a paragraph component as content whose conents will also be passed through the time tags key in the front end locals file.
  def self.paragraph_time_translation_object(date_first: nil, date_second: nil, to_present: nil)
      content_hash = {content: content_format_object(date_first: date_first, date_second: date_second, to_present: to_present)}
      data_hash = date_format_object(date_first: date_first, date_second: date_second)

      content_hash.merge(data_hash)
  end

  # Extracts and organises the dates of an item which can respond to start_date and end_date into a structure which a description list serializer can use as content.
  #
  # @param [Object] :item the item (such as a group) which responds to start_date and end_date.
  #
  # @return [Object] a hash arranged to be used in a description list component as content whose conents will also be passed through the time tags key in the front end locals file.
  def self.description_list_time_translation_object(date_first: nil, date_second: nil, to_present: nil)
    {}.tap do |hash|
      hash[:content] = content_format_object(date_first: date_first, date_second: date_second, to_present: to_present)
      hash[:data] = date_format_object(date_first: date_first, date_second: date_second)
    end
  end

  def self.content_format_object(date_first: nil, date_second: nil, to_present: nil)
    case
    when date_first && !date_second && to_present
      'shared.time-html-to-present'
    when date_first && date_second
      'shared.time-html-to'
    when date_first && !date_second
      'shared.time-html'
    end
  end

  def self.date_format_object(date_first: nil, date_second: nil)
    {}.tap do |hash|
      hash[:date_default] = I18n.l(date_first) if date_first
      hash[:datetime_format] = I18n.l(date_first, format: :datetime_format) if date_first
      hash[:date_default_second] = I18n.l(date_second) if date_second
      hash[:datetime_format_second] = I18n.l(date_second, format: :datetime_format) if date_second
    end
  end
end
