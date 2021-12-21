import Foundation

protocol RepositoriesCellViewModelType: AnyObject {
    
    var avatar: String { get }
    
    var nameRepository: String { get }
    
    var login: String { get }
}
