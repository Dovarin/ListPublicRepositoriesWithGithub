import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchRepositories(urlString: String, response: @escaping ([RepositoriesModel]?, Error?) -> Void) {
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            
            switch result {
            case .success(let data):
                do {
                    let repositories = try JSONDecoder().decode([RepositoriesModel].self, from: data)
                    response(repositories, nil)
                } catch let jsonError {
                    print("Faild to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error\(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
    
    func fetchInfoCommits(urlString: String, response: @escaping ([CommitModel]?, Error?) -> Void) {
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            
            switch result {
            case .success(let data):
                do {
                    let commits = try JSONDecoder().decode([CommitModel].self, from: data)
                    response(commits, nil)
                } catch let jsonError {
                    print("Faild to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error\(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
}

