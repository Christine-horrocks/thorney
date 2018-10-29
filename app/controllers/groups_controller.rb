class GroupsController < ApplicationController
  # Controller rendering group index and show pages
  before_action :build_request, :data_check

  ROUTE_MAP = {
    index: proc { ParliamentHelper.parliament_request.group_index },
    show:  proc { |params| ParliamentHelper.parliament_request.group_by_id.set_url_params({ group_id: params[:group_id] }) }
  }.freeze

  def index
    @groups = FilterHelper.filter(@api_request, 'Group')
    @groups = @groups.sort_by(:groupName, :graph_id)

    list_components = @groups.map do |group|
      paragraph_content = [time_translation_builder(group)]
      # paragraph_content = [].tap do |content|
      #   content << { content: 'shared.time-html-to', date_default_first: I18n.l(group.start_date), datetime_format_first: I18n.l(group.start_date, format: :datetime_format), date_default_second: I18n.l(group.end_date), datetime_format_second: I18n.l(group.end_date, format: :datetime_format) } if group.start_date && group.end_date
      #   content << { content: 'shared.time-html', date_default: I18n.l(group.start_date), datetime_format: I18n.l(group.start_date, format: :datetime_format) } if group.start_date && !group.end_date
      # end

      CardFactory.new(
        heading_text:      group.try(:groupName),
        heading_url:       group_path(group.graph_id),
        paragraph_content: paragraph_content
      ).build_card
    end

    heading = ComponentSerializer::Heading1ComponentSerializer.new(heading_content: I18n.t('groups.index.title'))

    serializer = PageSerializer::ListPageSerializer.new(request: request, heading_component: heading, list_components: list_components, data_alternates: @alternates)

    render_page(serializer)
  end

  def show
    @group = FilterHelper.filter(@api_request, 'Group')
    @group = @group.first

    serializer = PageSerializer::GroupsShowPageSerializer.new(request: request, group: @group, data_alternates: @alternates)

    render_page(serializer)
  end

  def time_translation_builder(group)
    if group.start_date && group.end_date
      {
        content: 'shared.time-html-to',
        date_default_first: I18n.l(group.start_date),
        datetime_format_first: I18n.l(group.start_date, format: :datetime_format),
        date_default_second: I18n.l(group.end_date),
        datetime_format_second: I18n.l(group.end_date, format: :datetime_format)
      }
    elsif group.start_date && !group.end_date
      {
        content: 'shared.time-html',
        date_default: I18n.l(group.start_date),
        datetime_format: I18n.l(group.start_date, format: :datetime_format)
      }
    else
      {}
    end
  end
end
