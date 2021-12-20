import Foundation

struct RepositoriesModel: Codable {
    let name: String
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case name
        case owner
    }
}

struct Owner: Codable {
    let login: String
    let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}


