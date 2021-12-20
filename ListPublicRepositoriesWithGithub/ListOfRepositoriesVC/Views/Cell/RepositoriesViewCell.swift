import Foundation
import UIKit
import SnapKit

class RepositoriesViewCell: UITableViewCell {
    
    let profileAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let nameRepositoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    
    weak var viewModel: RepositoriesCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }

            nameRepositoryLabel.text = viewModel.nameRepository
            loginLabel.text = viewModel.login
            profileAvatar.downloaded(from: viewModel.avatar)
        }
    }
    
    func setImage(urlString: String?) {
        
        if let url = urlString {
            NetworkRequest.shared.requestData(urlString: url) { [weak self] result in
                switch result {
                case .success(let data):
                    let image = UIImage(data: data)
                    self?.profileAvatar.image = image
                case .failure(_):
                    self?.profileAvatar.image = nil
                }
            }
        } else {
            profileAvatar.image = nil
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.addSubview(profileAvatar)
        self.addSubview(nameRepositoryLabel)
        self.addSubview(loginLabel)
    }
    
    private func setupConstraints() {
        
        profileAvatar.snp.makeConstraints {
            $0.height.width.equalTo(60)
            $0.centerY.equalTo(self)
            $0.leading.equalTo(self).inset(15)
        }
        
        nameRepositoryLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(10)
            $0.leading.equalTo(profileAvatar.snp.trailing).offset(10)
            $0.trailing.equalTo(self).offset(-10)
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(nameRepositoryLabel.snp.bottom).offset(10)
            $0.leading.equalTo(profileAvatar.snp.trailing).offset(10)
            $0.trailing.equalTo(self).offset(-10)
        }
    }
}
