import Foundation

final class Favourites{
    @Published var favorites = []
    
    func addItemToFavorites(by id: Int) {
        if let itemToAdd = .first(where: { $0.id == id }) {
                favorites.append(itemToAdd)
            }
        }
}
