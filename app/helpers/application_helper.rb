# frozen_string_literal: true
module ApplicationHelper
  def show_error(object, field)
    messages = object.errors.full_messages_for field
    return if messages.empty?
    content_tag :p, messages.first.lstrip, class: 'field-error'
  end
end
