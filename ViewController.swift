//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var coinManager = CoinManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Need to figure out how to connect the CoinManager to the ViewController for the delegate
        pickerView.dataSource = self
        pickerView.delegate = self
        coinManager.delegate = self
    }
    


}

extension ViewController: UIPickerViewDataSource    {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
}

extension ViewController: UIPickerViewDelegate  {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let cusip = coinManager.currencyArray[row]
        coinManager.fetchURL(for: cusip)
    }
    
}

extension ViewController: CoinManagerDelegate   {
 
     func didUpdateCoin(with: CoinData) {
        DispatchQueue.main.async {
            self.currencyLabel.text = with.quotedAsset
            self.outputLabel.text = with.getRate
            self.view.backgroundColor = with.getColor
        }
     
     }
    /*
    func didUpdateCoin(coin: Double, asset: String) {
        print("Current coin is: \(coin)")
        DispatchQueue.main.async {
            self.outputLabel.text = String(format: "%.2f", coin)
        }
 */
    
        
    }
    
   
    
    

