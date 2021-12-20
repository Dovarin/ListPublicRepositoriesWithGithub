import Foundation

protocol RepositoriesViewModelType {
    
    func numberOfRows() -> Int
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> RepositoriesCellViewModelType?
    
    func fetchMovies(competion: @escaping() -> ())
    
    func viewModelForSelectedRow() -> DetailViewModelType?
    
    func selectRow(atIndexPath indexPath: IndexPath)
}

