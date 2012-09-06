class TimesheetsController < ApplicationController
  def index
    # raise
    @date = Date.parse("1-#{params[:month]}-#{params[:year]}")
  end

  def new
    date = Date.new(params[:year].to_i, params[:month].to_i)
    @timesheet = current_user.timesheets.build(date:date)
  end

end
