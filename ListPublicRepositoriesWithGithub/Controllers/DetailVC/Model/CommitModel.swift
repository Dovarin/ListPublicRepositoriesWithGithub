import Foundation

struct CommitModel: Codable {
    let commit: Commit
    let parents: [Parent]

    enum CodingKeys: String, CodingKey {
        case parents
        case commit
    }
}

struct Commit: Codable {
    let author: CommitAuthor
    let message: String

    enum CodingKeys: String, CodingKey {
        case author, message
    }
}

struct Parent: Codable {
    let sha: String?

    enum CodingKeys: String, CodingKey {
        case sha
    }
}

struct CommitAuthor: Codable {
    let name: String?
    let date: String?
}
