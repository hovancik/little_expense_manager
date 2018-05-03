module ApplicationHelper
  def is_active?(test_path)
    request.path == test_path ? 'is-active' : ''
  end
end
