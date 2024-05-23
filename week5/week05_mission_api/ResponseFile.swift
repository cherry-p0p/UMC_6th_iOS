import Foundation


struct ResponseFile: Codable {
    let currentCount: Int?
    let data: [Datum]?
    let matchCount: Int?
    let page: Int?
    let perPage: Int?
    let totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case currentCount
        case data
        case matchCount
        case page
        case perPage
        case totalCount
    }
}

// MARK: - Datum
struct Datum: Codable {
    let address: String?
    let centerName: String?
    let centerType: CenterType?
    let createdAt: String?
    let facilityName: String?
    let id: Int?
    let lat: String?
    let lng: String?
    let org: String?
    let phoneNumber: String?
    let sido: String?
    let sigungu: String?
    let updatedAt: String?
    let zipCode: String?

    enum CodingKeys: String, CodingKey {
        case address
        case centerName
        case centerType
        case createdAt
        case facilityName
        case id
        case lat
        case lng
        case org
        case phoneNumber
        case sido
        case sigungu
        case updatedAt
        case zipCode
    }
}

enum CenterType: String, Codable {
    case 중앙권역 = "중앙/권역"
    case 지역 = "지역"
}
