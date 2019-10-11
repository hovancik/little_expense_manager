module AccountsHelper
  def who_should_pay_next(account)
    service = Accounts::WhoShouldPayNextService.new(account.id)
    result = service.perform
    result.name
  end

  def how_much_should_they_pay(account)
    service = Accounts::WhoShouldPayNextService.new(account.id)
    "Should pay #{service.how_much?} for others"
  end
end
