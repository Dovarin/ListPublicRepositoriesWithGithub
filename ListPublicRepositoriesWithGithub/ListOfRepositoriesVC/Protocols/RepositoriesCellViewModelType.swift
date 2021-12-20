//
//  RepositoriesCellViewModelType.swift
//  ListPublicRepositoriesWithGithub
//
//  Created by Данил Гусев on 17.12.2021.
//

import Foundation

protocol RepositoriesCellViewModelType: AnyObject {
    
    var avatar: String { get }
    
    var nameRepository: String { get }
    
    var login: String { get }
}
