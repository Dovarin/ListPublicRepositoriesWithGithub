import Foundation
import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    let profileAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let nameRepositoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    
    var viewModel: DetailViewModelType?
    var modelka: RepositoriesModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        
        self.nameRepositoryLabel.text = viewModel.nameRepository
        self.loginLabel.text = viewModel.login
        self.profileAvatar.downloaded(from: viewModel.avatar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(profileAvatar)
        view.addSubview(nameRepositoryLabel)
        view.addSubview(loginLabel)
    }
    
    func setupConstraints() {
        
        profileAvatar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.left.equalToSuperview().inset(20)
            $0.height.width.equalTo(100)
        }
        
        nameRepositoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.left.equalTo(profileAvatar.snp.right).offset(20)
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(nameRepositoryLabel.snp.bottom).offset(20)
            $0.left.equalTo(profileAvatar.snp.right).offset(20)
        }
    }
}
