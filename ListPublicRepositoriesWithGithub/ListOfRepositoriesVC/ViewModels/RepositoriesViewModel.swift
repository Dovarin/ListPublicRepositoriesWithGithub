import Foundation

class RepositoriesViewModel: RepositoriesViewModelType {

    let urlString = "https://api.github.com/repositories"
    
    private var selectedIndexPath: IndexPath?
    
    var repositories: [RepositoriesModel]?
    
    func numberOfRows() -> Int {
        return repositories?.count ?? 0
    }
    
    func fetchMovies (competion: @escaping() -> ()) {
        NetworkDataFetch.shared.fetchRepositories(urlString: urlString) { [weak self] (result, error) in
            if error == nil {
                self?.repositories = result
                competion()
            } else {
                print(error as Any)
            }
        }
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> RepositoriesCellViewModelType? {
        guard let repositories = repositories else { return nil }

        let repository = repositories[indexPath.row]
        return RepositoriesViewCellViewModel(repositories: repository)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(repositories: (repositories?[selectedIndexPath.row])!)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
