module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end
end
