module TimesheetsHelper
  def link_to_previous_month
    pm = @date.months_ago(1)
    link_to "Previous month", action: :show, month: pm.month, year: pm.year
  end
  def link_to_next_month
    nm = @date.months_ago(-1)
    link_to "Next month", action: :show, month: nm.month, year: nm.year
  end
end
