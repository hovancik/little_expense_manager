module AccountsHelper
  def who_should_pay_next(account)
    service = Accounts::WhoShouldPayNextService.new(account.id)
    result = service.perform
    result.name
  end
end
