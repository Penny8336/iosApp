import UIKit

import CryptoKit
import Foundation
func getTimeString() -> String {
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "EEE, dd MMM yyyy HH:mm:ww zzz"
    dateFormater.locale = Locale(identifier: "en_US")
    dateFormater.timeZone = TimeZone(secondsFromGMT: 0)
    let time = dateFormater.string(from: Date())
    return time
}
let appId = "a981984e5cae4a34bf47f91567f1a207"
let appKey = "Zc9QZL0LwVx1RBKwC08ufWxQXFM"
let xdate = getTimeString()
let signDate = "x-date: \(xdate)"
let key = SymmetricKey(data: Data(appKey.utf8))
let hmac = HMAC<SHA256>.authenticationCode(for: Data(signDate.utf8), using: key)
let base64HmacString = Data(hmac).base64EncodedString()
let authorization = """
hmac username="\(appId)", algorithm="hmac-sha256", headers="x-date", signature="\(base64HmacString)"
"""
let url = URL(string: "https://ptx.transportdata.tw/MOTC/v2/Bus/EstimatedTimeOfArrival/City/Taipei/630?$top=5&$format=JSON")!
var request = URLRequest(url: url)
request.setValue(xdate, forHTTPHeaderField: "x-date")
request.setValue(authorization, forHTTPHeaderField: "Authorization")
URLSession.shared.dataTask(with: request) { (data, response, error) in
    if let data = data {
        let content = String(data: data, encoding: .utf8) ?? ""
        print(type(of: content))
        
        
        struct Loan: Codable {
            var StopUID: String
            var Zh_tw: String
            var Direction: Int //0:'去程',1:'返程',2:'迴圈',255:'未知']
            var EstimateTime: Int
        
            enum CodingKeys: String, CodingKey {
                case StopUID
                case Zh_tw = "StopName"
                case Direction
                case EstimateTime
            }
        
            enum LocationKeys: String, CodingKey {
                case Zh_tw
            }
        
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                let StopName = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .Zh_tw)
        
                Zh_tw = try StopName.decode(String.self, forKey: .Zh_tw)
        
                StopUID = try values.decode(String.self, forKey: .StopUID)
                Direction = try values.decode(Int.self, forKey: .Direction)
                EstimateTime = try values.decode(Int.self, forKey: .EstimateTime)
        
            }
        }
        let decoder = JSONDecoder()
        let jsonData = content.data(using: .utf8)!
//        let loan = try decoder.decode([Loan].self, from: jsonData)


    }
}.resume()


