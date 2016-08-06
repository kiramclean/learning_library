# frozen_string_literal: true
module FullTitleHelper
  def full_title(page_title = '')
    base_title = 'Learning Library'
    if page_title.blank?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
