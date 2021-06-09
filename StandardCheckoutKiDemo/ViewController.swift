//
//  ViewController.swift
//  StandardCheckoutKiDemo
//
//  Created by Vinicius on 09/06/17.
//  Copyright © 2017 Paymentz. All rights reserved.
//

import UIKit
import StandardCheckoutKit

class ViewController: UIViewController, StandardCheckoutDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    @IBAction func pay(_ sender: UIButton) {
        
        let secureKey = "bzI93aEQeYDeE50Pa929NiDk3us8XTbU"
        
        let requestParameters = RequestParameters()
        requestParameters.memberId = "10558"
        requestParameters.paymentMode = PaymentMode().cc
        requestParameters.terminalId = "1106"
        requestParameters.merchantTransactionId = "randomnumber2699"
        requestParameters.amount = "50.00"
        requestParameters.currency = "USD"
        requestParameters.toType = "paymentz"
        requestParameters.paymentBrand = PaymentBrand().visa
        requestParameters.merchantRedirectUrl = "www.paymentz.com"
        requestParameters.tmplAmount = "50.00"
        requestParameters.tmplCurrency = "USD"
        requestParameters.orderDescription = "Test"
        requestParameters.country = "IN"
        requestParameters.state = "MH"
        requestParameters.street = "Malad"
        requestParameters.city = "Mumbai"
        requestParameters.email = "savitha.m@paymentz.com"
        requestParameters.postCode = "400064"
        requestParameters.telnocc = "+91"
        requestParameters.phone = "9096831666"
        requestParameters.hostUrl = "https://preprod.paymentz.com/transaction/Checkout"
        requestParameters.device = "ios"
        let standardCheckout = StandardCheckout(viewController: self)
        standardCheckout.initPayment(requestParameters: requestParameters, standardCheckoutDelegate: self, secureKey: secureKey)
    }

    // Delegate methods is where you will receive the payment result
    func onSuccess(standardCheckoutResult: StandardCheckoutResult) {
        let resultViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        let json = standardCheckoutResult.json
        resultViewController.standardCheckoutResult = "\(json)"
        let resultNavigationController: UINavigationController = UINavigationController(rootViewController: resultViewController)
        self.present(resultNavigationController, animated: true, completion: nil)
    }
    
    func onFail() {
        let alert = UIAlertController(title: "Fail", message: "Fail transaction", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

