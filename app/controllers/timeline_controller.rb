# Filter WorkLogs in different ways, with pagination
class TimelineController < ApplicationController

  def list
    @filter_params = {}
    [:filter_user, :filter_status, :filter_project, :filter_date, :filter_task].each do |fp|
      @filter_params[fp] = params[fp] unless params[fp].blank?
    end

    @logs, @work_logs= EventLog.event_logs_for_timeline(current_user, params)
  end
end
