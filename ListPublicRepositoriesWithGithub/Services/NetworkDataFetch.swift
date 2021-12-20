import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchRepositories(urlString: String, response: @escaping ([RepositoriesModel]?, Error?) -> Void) {
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            
            switch result {
            case .success(let data):
                do {
                    let albums = try JSONDecoder().decode([RepositoriesModel].self, from: data)
                    response(albums, nil)
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

