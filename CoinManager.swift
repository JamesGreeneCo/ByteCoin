//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

protocol CoinManagerDelegate {
    //func didFailWithError(error: Error)
    //func didUpdateCoin(coin: Double, asset: String)
    func didUpdateCoin(with: CoinData)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "AA8BA3A0-8AF6-4798-8E06-E6B375ED0CCB"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    //Setting up networking
    
    //Step 1: Create a URL
    
    func fetchURL(for currency: String) {
        let urlString = "https://rest.coinapi.io/v1/exchangerate/BTC/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String)    {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            //let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            let task = session.dataTask(with: url) { (data, reponse, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data    {
                    let bitcoinPrice = self.parseJSON(safeData)
                    //delegate?.didUpdateCoin(coin: bitcoinPrice!)
                    delegate?.didUpdateCoin(with: bitcoinPrice!)
                    
                    
                    //let dataString = String(data: safeData, encoding: .utf8)
                    //print(dataString)
                    /*
                    if let coin = self.parseJSON(coinData: safeData)    {
                        delegate?.didUpdateCoin(coin: coin)
                    }
 */
                    
                }
            }
            
            task.resume()
        }
    }
    func parseJSON(_ coinData: Data) -> CoinData?  {
        let decoder = JSONDecoder()
        do  {
            let decodedData = try decoder.decode(CoinModel.self, from: coinData)
            
            
            let rate = decodedData.rate
            let asset_id_quote = decodedData.asset_id_quote
            let coinObject = CoinData(currencyRate: rate, quotedAsset: asset_id_quote)
            //print(rate)
            //Need to return the object since I need to get the rate & asset_id_quote
            
            return coinObject
        } catch {
            print(error)
            return nil
        }
        
    }
        
}
