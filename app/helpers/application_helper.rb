# frozen_string_literal: true

module ApplicationHelper
  def navbar_button_class(year)
    return "btn btn-primary navbar-btn btn-sm" unless current_page?(year: year)

    "btn btn-primary navbar-btn btn-sm active"
  end

  def current_year_from_url
    request.path_parameters[:year]
  end
end
