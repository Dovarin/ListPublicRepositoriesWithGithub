import Foundation

protocol DetailViewModelType {
    
    var avatar: String { get }

    var nameRepository: String { get }

    var login: String { get }
    
    var name: String { get }
    
    var message: String { get }
    
    var dateCommit: String { get }
    
    var shaOne: String { get }
    
    var shaTwo: String { get }
    
    func fetchCommit(competion: @escaping() -> ())
    
    func setDateFormat(date: String) -> String
}
