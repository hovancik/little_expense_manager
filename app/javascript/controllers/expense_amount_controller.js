import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'amount', 'useramount' ]

  // share expense by the same ratio
  divide () {
    this._resetValues()
    if (this.useramountTargets.length == 1) {
      this.useramountTarget.value = this.amountTarget.value
    } else {
      for (const undividedElement of this.useramountTargets) {
        undividedElement.value = this._userExpenseValue()
        undividedElement.classList.add('divided')
      }
    }
  }

  _userExpenseValue () {
    return this.round(this._toDevideSum()/this._undividedElements(), 2)
  }

  _dividedSum () {
    let value = 0.00
    for (const dividedElement of this.element.querySelectorAll('.divided')) {
      value += parseFloat(dividedElement.value)
    }
    return value
  }

  _toDevideSum () {
    return parseFloat(this.amountTarget.value) - this._dividedSum()
  }

  _undividedElements () {
    return parseFloat(this.useramountTargets.length - this.element.querySelectorAll('.divided').length)
  }

  _resetValues () {
    for (const undividedElement of this.useramountTargets) {
      undividedElement.value = ''
      undividedElement.classList.remove('divided')
    }
  }

  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round#A_better_solution
  round (number, precision) {
    var shift = function (number, precision) {
      var numArray = ("" + number).split("e");
      return +(numArray[0] + "e" + (numArray[1] ? (+numArray[1] + precision) : precision));
    };
    return shift(Math.round(shift(number, +precision)), -precision);
  }

}
