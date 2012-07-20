class TimesheetsController < ApplicationController
  def show
    @date = Date.parse("1-#{params[:month]}-#{params[:year]}")
  end
end
