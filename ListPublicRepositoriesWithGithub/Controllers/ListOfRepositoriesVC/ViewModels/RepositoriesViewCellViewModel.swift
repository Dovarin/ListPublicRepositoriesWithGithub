import Foundation

class RepositoriesViewCellViewModel: RepositoriesCellViewModelType {
    
    private var repositories: RepositoriesModel
    
    init(repositories: RepositoriesModel) {
        self.repositories = repositories
    }
    
    var avatar: String {
        return repositories.owner.avatarURL ?? ""
    }
    
    var nameRepository: String {
        return ("Repository: " + repositories.name)
    }
    
    var login: String {
        return ("Login: " + repositories.owner.login)
    }
}
