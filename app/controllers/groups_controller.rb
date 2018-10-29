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
      paragraph_content = [TimeHelper.paragraph_time_translation_object(date_first: group.start_date, date_second: group.end_date)]

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
end
