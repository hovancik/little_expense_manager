# creating new user

```
user = User.create(email: '', password: '', name: '')
account = Account.create(name: 'Personal', description: 'My expenses')
user.accounts << account
Category.create(name: 'Groceries', account: account)
Category.create(name: 'Going out', account: account)
Category.create(name: 'Traveling', account: account)
Category.create(name: 'Household', account: account)
Category.create(name: 'Healthcare', account: account)
Category.create(name: 'Eating out', account: account)
Category.create(name: 'Apparel', account: account)
Category.create(name: 'Charity', account: account)
Category.create(name: 'Education', account: account)
Category.create(name: 'Together', account: account)
Category.create(name: 'Other', account: account)
```
