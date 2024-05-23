import Foundation

class OrderFood {
    var name: String
    var price: Int
    var menu: Int
    var quantity: Int
    
    init(name: String, price: Int, menu: Int, quantity: Int) {
        self.name = name
        self.price = price
        self.menu = menu
        self.quantity = quantity
    }
}
