require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  setup do
    @password = "password123"
    @user = User.create!(
      email: "system@example.com",
      name: "System User",
      password: @password,
      password_confirmation: @password,
      send_reports: true
    )
    @account = Account.create!(name: "Smoke Account", description: "System test")
    @user.accounts << @account
    @category = Category.create!(name: "Smoke Category", account: @account, bucket_amount: 0)
  end

  test "login, dashboard, and logout" do
    login

    assert_current_path dashboard_path
    assert_text @account.name

    click_link "Logout"

    assert_current_path root_path
    assert_link "Login"
  end

  test "add and edit expense" do
    login

    find("[data-tooltip='Add new expense to the #{@account.name} account']").click
    assert_selector ".modal-card-title", text: "Add new expense"

    select @category.name, from: "expense_category_id"
    fill_in "expense_amount", with: "25.50"
    fill_in "expense_note", with: "Smoke expense"
    click_button "Add expense"

    assert_no_selector ".modal-card-title", text: "Add new expense"
    expense = Expense.find_by!(account: @account, note: "Smoke expense")
    assert_equal BigDecimal("25.50"), expense.amount

    visit account_expenses_path(@account)
    within("tr", text: "Smoke expense") do
      find("[data-tooltip='Edit expense details']").click
    end

    assert_selector ".modal-card-title", text: "Edit expense"
    fill_in "expense_amount", with: "31.75"
    fill_in "expense_note", with: "Updated smoke expense"
    click_button "Edit expense"

    assert_no_selector ".modal-card-title", text: "Edit expense"
    within("tr", text: "Updated smoke expense") do
      assert_text "31.75"
      assert_text "Updated smoke expense"
    end
    assert_equal BigDecimal("31.75"), expense.reload.amount
    assert_equal "Updated smoke expense", expense.note
  end

  private

  def login
    visit new_session_path

    fill_in "session_email", with: @user.email
    fill_in "session_password", with: @password
    click_button "Login"
  end
end
