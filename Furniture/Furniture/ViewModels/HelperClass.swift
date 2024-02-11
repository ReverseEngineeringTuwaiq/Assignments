import SwiftUI

// Screen width.
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

func widthPercent(_ percent: CGFloat) -> CGFloat {
    return screenWidth / 100 * percent
}

func heightPercent(_ percent: CGFloat) -> CGFloat {
    return screenHeight / 100 * percent
}


class userdefault {
    static var cat_product_id = "cat_product_id"
    static var generateOrderID = "generateOrderID"
    
}

func deleteCartData() {
    UserDefaults.standard.removeObject(forKey: userdefault.cat_product_id)
}

func saveData(val: CartModel) {
    var x = [CartModel]()
    if let objects = UserDefaults.standard.value(forKey: userdefault.cat_product_id) as? Data {
        let decoder = JSONDecoder()
        if let objectsDecoded = try? decoder.decode([CartModel].self, from: objects) as [CartModel] {
            x.append(contentsOf: objectsDecoded)
            x.removeAll(where: { $0.name == val.name })
//            let chckVal = x.contains { compare in
//                if compare.name == val.name {
//                    return true
//                    
//                }
//                return false
//            }
//            if chckVal == false {
//                x.append(contentsOf: objectsDecoded)
//            }
        }
        x.append(val)
        let encoder = JSONEncoder()
        if let encoded1 = try? encoder.encode(x){
            UserDefaults.standard.set(encoded1, forKey: userdefault.cat_product_id)
        }
    } else {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode([val]){
            UserDefaults.standard.set(encoded, forKey: userdefault.cat_product_id)
        }
    }
}

func getCartData() -> [CartModel]? {
    
    var x = [CartModel]()
    if let objects = UserDefaults.standard.value(forKey: userdefault.cat_product_id) as? Data {
        let decoder = JSONDecoder()
        if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [CartModel] {
            x.append(contentsOf: objectsDecoded)
        }
    }
    return x
}

func getTotalAmt() -> Float? {
    
    var x: Float = 0.0
    if let objects = UserDefaults.standard.value(forKey: userdefault.cat_product_id) as? Data {
        let decoder = JSONDecoder()
        if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [CartModel] {
            for i in objectsDecoded {
                x = x + ((i.price?.toFloat() ?? 0) * Float((i.qty ?? 1)))
            }
        }
    }
    return x
}

func getTotalIDs() -> String? {
    
    var x: [String] = []
    if let objects = UserDefaults.standard.value(forKey: userdefault.cat_product_id) as? Data {
        let decoder = JSONDecoder()
        if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [CartModel] {
            for i in objectsDecoded {
                x.append("(\(i.id!),\(i.qty!))")
            }
        }
    }
    return x.joined(separator: ",")
}








extension String {
        //Converts String to Int
        public func toInt() -> Int? {
            if let num = NumberFormatter().number(from: self) {
                return num.intValue
            } else {
                return nil
            }
        }

        //Converts String to Double
        public func toDouble() -> Double? {
            if let num = NumberFormatter().number(from: self) {
                return num.doubleValue
            } else {
                return nil
            }
        }

        /// EZSE: Converts String to Float
        public func toFloat() -> Float? {
            if let num = NumberFormatter().number(from: self) {
                return num.floatValue
            } else {
                return nil
            }
        }

        //Converts String to Bool
        public func toBool() -> Bool? {
            return (self as NSString).boolValue
        }
    }
