require_relative '../../rails_helper'

RSpec.describe TimeHelper, type: :helper do

  let(:first) { DateTime.parse('23/12/2016') }
  let(:second) { DateTime.parse('23/12/2017') }

  describe '#paragraph_time_translation_object' do
    it 'creates a hash which can be passed to a paragraph serializer as content' do
      paragraph_time_translation_object_example = TimeHelper.paragraph_time_translation_object(date_first: first, date_second: second)

      expect(paragraph_time_translation_object_example).to eq({ :content=>"shared.time-html-to", :date_default_first=>"23 December 2016", :date_default_second=>"23 December 2017", :datetime_format_first=>"2016-12-23", :datetime_format_second=>"2017-12-23" })
    end

    it 'creates a hash without an end date' do
      paragraph_time_translation_object_example = TimeHelper.paragraph_time_translation_object(date_first: first)

      expect(paragraph_time_translation_object_example).to eq({ :content=>"shared.time-html", :date_default=>"23 December 2016", :datetime_format=>"2016-12-23" })
    end
  end
end
