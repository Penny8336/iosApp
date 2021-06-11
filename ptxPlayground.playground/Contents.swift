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
        struct User: Codable {
            var StopUID: String
            var StopID: String
        }
        

        
        let jsonData = content.data(using: .utf8)!
        let users = try! JSONDecoder().decode([User].self, from: jsonData)

        for user in users {
            print(user.StopUID)
        }
        
        
    }
}.resume()

//let json = """
//{
//
//"name": "John Davis",
//"country": "Peru",
//"use": "to buy a new collection of clothes to stock her shop before the holidays.",
//"amount": 150
//
//}
//"""
//
//struct Loan: Codable {
//    var name: String
//    var country: String
//    var use: String
//    var amount: Int
//}
//
//let decoder = JSONDecoder()
//
//if let jsonData = json.data(using: .utf8) {
//
//    do {
//        let loan = try decoder.decode(Loan.self, from: jsonData)
//        print(loan)
//
//    } catch {
//        print(error)
//    }
//}


