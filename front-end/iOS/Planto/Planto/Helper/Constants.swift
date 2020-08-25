import Foundation
import UIKit

class Constants {
    struct SegueName {
        static let findPlant = "FindPlant"
        static let foundPlant = "PlantFound"
        static let checkPlant = "CheckPlant"
        static let otherPlants = "OtherPlants"
        static let selectPlant = "SelectPlant"
        static let namePlant = "NamePlant"
        static let confirmName = "ConfirmName"
        static let beforeManage = "beforeManage"
        static let howtoManage = "howToManage"
    }
    
    struct Color {
        static let greenColor = UIColor(red: 85/255, green: 144/255, blue: 121/255, alpha: 1)
    }
    
    struct User {
        enum Info: String {
            case Authenticated
            case AutoLogIn
            case Email
            case NickName
            case Password
            case Token
        }
        static let email = "email"
        static let username = "username"
        static let password = "password"
        static let token = "token"
    }
    
    struct RestConfig {
        static let baseURL = "https://pers0n4.dev/"
        static let joinURL = "\(RestConfig.baseURL)users"
        static let signInURL = "\(RestConfig.baseURL)auth"
    }
}
