import Foundation

struct User: Codable, Equatable, Identifiable {
    let id: UUID
    let fullName: String
}

