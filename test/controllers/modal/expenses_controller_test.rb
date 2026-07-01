require 'test_helper'

class Modal::ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @password = 'password123'
    @user = User.create!(
      email: 'modal-expenses@example.com',
      name: 'Modal Expenses',
      password: @password,
      password_confirmation: @password,
      send_reports: true
    )
    @account = Account.create!(name: 'Test account', description: 'Test description')
    @account.users << @user
  end

  test 'new defaults paid_at to passed month' do
    post sessions_path, params: { session: { email: @user.email, password: @password } }
    assert_response :success

    get new_modal_expense_path(
      account_id: @account.id,
      month: '2024-03-15',
      refresh_id: 'current-expenses-refresh',
      refresh_url: loader_expenses_path(account_id: @account.id, month: '2024-03-15')
    )

    assert_response :success
    assert_select "input#expense_paid_at[value='2024-03-15']"
  end

  test 'new defaults paid_at to current date when month is not passed' do
    travel_to Time.zone.parse('2024-04-22 12:00:00') do
      post sessions_path, params: { session: { email: @user.email, password: @password } }
      assert_response :success

      get new_modal_expense_path(
        account_id: @account.id,
        refresh_id: 'current-expenses-refresh',
        refresh_url: loader_expenses_path(account_id: @account.id)
      )

      assert_response :success
      assert_select "input#expense_paid_at[value='2024-04-22']"
    end
  end
end
