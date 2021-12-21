import Foundation

extension RepositoriesViewCell {
    
    func setupConstraints() {
        
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
