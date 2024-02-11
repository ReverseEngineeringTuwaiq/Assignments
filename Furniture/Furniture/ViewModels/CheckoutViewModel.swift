import UIKit
import Supabase


struct CartModel: Identifiable, Codable {
    var name: String?
    var id: String?
    var desc: String?
    var price: String?
    var image: String?
    var qty: Int?
    
    init(name: String? = nil, id: String? = nil, desc: String? = nil, price: String? = nil, image: String? = nil, qty: Int? = nil) {
        self.name = name
        self.id = id
        self.desc = desc
        self.price = price
        self.image = image
        self.qty = qty
    }
}


struct CheckoutModel: Encodable {
    var product_qty: String
    var order_id: String
}

final class CheckoutViewModel: ObservableObject {

    func updateCheckout(productIDs: String, orderID: String) async {
        
        let supabase = SupabaseClient(supabaseURL: URL(string: "https://zrpvrhzeutmirzwxybng.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpycHZyaHpldXRtaXJ6d3h5Ym5nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyODg1MzEsImV4cCI6MjAyMjg2NDUzMX0.515IPdVS011qjrql85X3gLZ30Pvj76fuU1r8Btj3FKA")
        
        let tableName = "ordered_products"

        let country = CheckoutModel(product_qty: productIDs, order_id: orderID)

        // Insert the values into the table
        do {
            
            try await supabase.database
                .from(tableName)
                .insert(country)
                .execute()
        } catch let error {
            print(error)
        }
    }
    
    func updateCheckoutDone(productIDs: String, orderID: String) {
        Task {
            await updateCheckout(productIDs: productIDs, orderID: orderID)
        }
    }

}
