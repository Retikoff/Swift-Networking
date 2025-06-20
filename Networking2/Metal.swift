import Foundation

struct Metal: Codable{
    let id:Int
    let name:String
    let nameBel:String
    let nameEng:String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case nameBel = "NameBel"
        case nameEng = "NameEng"
    }
}
