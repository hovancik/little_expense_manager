module ApplicationHelper
  def active?(test_path)
    request.path == test_path ? 'is-active' : ''
  end
end
