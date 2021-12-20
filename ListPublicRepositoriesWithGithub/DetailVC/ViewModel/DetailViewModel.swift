import Foundation

class DetailViewModel: DetailViewModelType {
    
    private var repositories: RepositoriesModel
    
    init(repositories: RepositoriesModel) {
        self.repositories = repositories
    }
    
    var avatar: String {
        return repositories.owner.avatarURL ?? ""
    }

    var nameRepository: String {
        return repositories.name
    }

    var login: String {
        return repositories.owner.login
    }
//    var avatar: Box<String?> = Box(nil)
//
//    var nameRepository: Box<String?> = Box(nil)
//
//    var login: Box<String?> = Box(nil)
}
