//
//  CoinData.swift
//  ByteCoin
//
//  Created by Connor J. Greene on 12/27/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct CoinData {
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    let currencyRate: Double
    let quotedAsset: String
    
    var getColor: UIColor   {
        switch quotedAsset {
        case currencyArray[0]...currencyArray[1]:
            return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        case currencyArray[2]...currencyArray[3]:
            return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case currencyArray[3]...currencyArray[4]:
            return #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        case currencyArray[5]...currencyArray[6]:
            return #colorLiteral(red: 0.1058823529, green: 0.262745098, blue: 0.2823529412, alpha: 1)
        case currencyArray[7]...currencyArray[8]:
            return #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        case currencyArray[9]...currencyArray[10]:
            return #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        case currencyArray[11]...currencyArray[12]:
            return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        case currencyArray[13]...currencyArray[14]:
            return #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        case currencyArray[15]...currencyArray[16]:
            return #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        case currencyArray[17]...currencyArray[18]:
            return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        case currencyArray[19]...currencyArray[20]:
            return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case currencyArray[21]:
            return #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        default:
            return #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        }
    }
    
    var getRate: String   {
        return String(format: "%.2f", currencyRate)
    }
}
