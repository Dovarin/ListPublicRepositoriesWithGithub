import Foundation

class DetailViewModel: DetailViewModelType {
    
    private var repositories: RepositoriesModel
    
    var commit: CommitModel?
    
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
        return ("Login: " + repositories.owner.login)
    }
    
    var name: String {
        return ("Name author: " + (commit?.commit.author.name ?? "No name"))
    }
    
    var message: String {
        return ("Commit message: " + (commit?.commit.message ?? "No message"))
    }
    
    var dateCommit: String {
        return commit?.commit.author.date ?? "No date"
    }
    
    var shaOne: String {
        return ("Parents sha: " + (commit?.parents.first?.sha ?? "No Sha"))
    }
    
    var shaTwo: String {
        commit?.parents.last?.sha == commit?.parents.first?.sha ?
                                    "The second sha is missing" : ("Parents sha: " + (commit?.parents.last?.sha)!)
    }
    
    func fetchCommit(competion: @escaping() -> ()) {
        
        let urlString = "https://api.github.com/repos/\(repositories.owner.login)/\(repositories.name)/commits"
        
        NetworkDataFetch.shared.fetchInfoCommits(urlString: urlString) { [weak self] (result, error) in
            if error == nil {
                self?.commit = result?.first

                competion()
            } else {
                print(error as Any)
            }
        }
    }
}
