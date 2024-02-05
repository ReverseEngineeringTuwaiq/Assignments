

enum VendingMachine: Error{
    case OrangeFinish , HigherPrice, PaymentProblem, EliectricProblem
}

func checkOrange(with OrangeISFinish: String) throws -> String {
    if OrangeISFinish.isEmpty{
        throw VendingMachine.OrangeFinish
    } else {
        return "Orange is available"
    }
}
func checkHigherPrice(with HigherISPrice: Int) throws -> String {
    if HigherISPrice > 40 {
        throw VendingMachine.HigherPrice
    } else {
        return "Price is High"
    }
}
func checkPaymentProblem(with PaymentISProblem: Int) throws -> String {
    if PaymentISProblem == 0 {
        throw VendingMachine.PaymentProblem
    } else {
        return "there is a Payment Problem"
    }
}
func checkEliectricProblem(with EliectricISProblem: Int) throws -> String {
    if EliectricISProblem == 0 {
        throw VendingMachine.EliectricProblem
    } else {
        return "there is a Eliectric Problem"
    }
}

var MyItem = "1"

do{
let result = try checkOrange(with: MyItem)
    print("Juice Orange \(result)")
} catch VendingMachine.EliectricProblem {
    print("VendingMachine.EliectricProblem")
} catch VendingMachine.HigherPrice {
    print("VendingMachine.HigherPrice")
} catch{
    print("nothing")
}

