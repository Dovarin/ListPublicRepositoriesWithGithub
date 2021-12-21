import Foundation
import UIKit

class DetailViewController: UIViewController, BaseInitialProtocol {
    
    let profileAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let nameRepositoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0 
        
        return label
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Information on the last commit:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    let messageCommitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let nameAuthorCommitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    let lastDateCommitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    let shaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let shaLabelTwo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    var viewModel: DetailViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupBind()
        loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(profileAvatar)
        view.addSubview(nameRepositoryLabel)
        view.addSubview(loginLabel)
        view.addSubview(titleLabel)
        view.addSubview(messageCommitLabel)
        view.addSubview(nameAuthorCommitLabel)
        view.addSubview(lastDateCommitLabel)
        view.addSubview(shaLabel)
        view.addSubview(shaLabelTwo)
    }
    
    func setupNavigationBar() {
        title = viewModel?.nameRepository
    }
    
    func setupBind() {
        guard let viewModel = viewModel else { return }
        
        self.nameRepositoryLabel.text = viewModel.nameRepository
        self.loginLabel.text = viewModel.login
        self.profileAvatar.downloaded(from: viewModel.avatar)
    }
    
    func loadData() {
        viewModel?.fetchCommit { [weak self] in
            self?.messageCommitLabel.text = self?.viewModel?.message
            self?.nameAuthorCommitLabel.text = self?.viewModel?.name
            self?.lastDateCommitLabel.text = self?.viewModel?.setDateFormat(date: self?.viewModel?.dateCommit ?? "No date")
            self?.shaLabel.text = self?.viewModel?.shaOne
            self?.shaLabelTwo.text = self?.viewModel?.shaTwo
        }
    }
}
