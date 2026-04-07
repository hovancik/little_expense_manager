import Rails from '@rails/ujs'
Rails.start()

import { Application } from '@hotwired/stimulus'

import ExpenseAmountController from './controllers/expense_amount_controller'
import LoadModalController from './controllers/load_modal_controller'
import LoaderController from './controllers/loader_controller'
import ModalController from './controllers/modal_controller'
import SubmitController from './controllers/submit_controller'

const application = Application.start()
application.register('expense-amount', ExpenseAmountController)
application.register('load-modal', LoadModalController)
application.register('loader', LoaderController)
application.register('modal', ModalController)
application.register('submit', SubmitController)
