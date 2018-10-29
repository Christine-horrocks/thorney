module TimeHelper
  # Extracts and organises the dates of an item which can respond to start_date and end_date into a structure which a paragraph serializer can use as content.
  #
  # @param [Object] :item the item (such as a group) which responds to start_date and end_date.
  #
  # @return [Object] a hash arranged to be used in a paragraph component as content whose conents will also be passed through the time tags key in the front end locals file.
  def self.paragraph_time_translation_object(date_first: nil, date_second: nil)
      {}.tap do |hash|
        hash[:content] = 'shared.time-html-to' if date_first && date_second
        hash[:content] = 'shared.time-html' if date_first && !date_second
        hash[:date_default] = I18n.l(date_first) if date_first
        hash[:datetime_format] = I18n.l(date_first, format: :datetime_format) if date_first
        hash[:date_default_second] = I18n.l(date_second) if date_second
        hash[:datetime_format_second] = I18n.l(date_second, format: :datetime_format) if date_second
      end
  end

  # Extracts and organises the dates of an item which can respond to start_date and end_date into a structure which a description list serializer can use as content.
  #
  # @param [Object] :item the item (such as a group) which responds to start_date and end_date.
  #
  # @return [Object] a hash arranged to be used in a description list component as content whose conents will also be passed through the time tags key in the front end locals file.
  def self.description_list_time_translation_object(date_first: nil, date_second: nil)
    {}.tap do |hash|
      hash[:content] = 'shared.time-html-to' if date_first && date_second
      hash[:content] = 'shared.time-html' if date_first && !date_second
      hash[:data] = {}.tap do |data|
        data[:date_default] = I18n.l(date_first) if date_first
        data[:datetime_format] = I18n.l(date_first, format: :datetime_format) if date_first
        data[:date_default_second] = I18n.l(date_second) if date_second
        data[:datetime_format_second] = I18n.l(date_second, format: :datetime_format) if date_second
      end
    end
  end
end
