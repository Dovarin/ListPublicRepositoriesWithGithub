import Foundation
import SnapKit
import UIKit

extension DetailViewController {

    func setupConstraints() {
        
        profileAvatar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.left.equalToSuperview().inset(20)
            $0.height.width.equalTo(100)
        }
        
        nameRepositoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.left.equalTo(profileAvatar.snp.right).offset(20)
            $0.right.equalToSuperview()
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(nameRepositoryLabel.snp.bottom).offset(10)
            $0.left.equalTo(profileAvatar.snp.right).offset(20)
            $0.right.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(profileAvatar.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        messageCommitLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview()
        }
        
        nameAuthorCommitLabel.snp.makeConstraints {
            $0.top.equalTo(messageCommitLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview()
        }
        
        lastDateCommitLabel.snp.makeConstraints {
            $0.top.equalTo(nameAuthorCommitLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview()
        }
        
        shaLabel.snp.makeConstraints {
            $0.top.equalTo(lastDateCommitLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview()
        }
        
        shaLabelTwo.snp.makeConstraints {
            $0.top.equalTo(shaLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview()
        }
    }
}
