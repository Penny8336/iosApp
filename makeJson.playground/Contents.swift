import UIKit

let json = """

[{"name":"TPE56992","use":"56992","location":{"country":"忠三街口","En":"Zhongsan St. Entrance"},"RouteUID":"TPE10861","RouteID":"10861","RouteName":{"Zh_tw":"630","En":"630"},"Direction":1,"StopStatus":3,"SrcUpdateTime":"2021-06-12T01:46:10+08:00","UpdateTime":"2021-06-12T01:46:15+08:00"}]
"""

struct Loan: Codable {
    var name: String
    var country: String
    var use: String

    enum CodingKeys: String, CodingKey {
        case name
        case country = "location"
        case use
    }

    enum LocationKeys: String, CodingKey {
        case country
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        
        country = try location.decode(String.self, forKey: .country)
        
        name = try values.decode(String.self, forKey: .name)
        use = try values.decode(String.self, forKey: .use)

    }
}

let decoder = JSONDecoder()

let jsonData = json.data(using: .utf8)!
let loan = try decoder.decode([Loan].self, from: jsonData)

for user in loan {
    print(user)
}

print(json)
func greet(person: String) {
    print("Hello, \(person)!")


}
greet(person: json)
