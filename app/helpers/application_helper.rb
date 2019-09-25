module ApplicationHelper
  def active?(test_path)
    request.path == test_path ? 'is-active' : ''
  end

  def is_hidden_for(account)
    account.users.size == 1 ? 'is-hidden' :  ''
  end
end
