//
//  ViewController.swift
//  StandardCheckoutKiDemo
//


//

import UIKit
import StandardCheckoutKit

class ViewController: UIViewController, StandardCheckoutDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    @IBAction func pay(_ sender: UIButton) {
        
        let secureKey = "znOd1gM5iOYeL03kB9v9aXapJXkwmOQn"
        
        let requestParameters = RequestParameters()
        requestParameters.memberId = "11344"
        requestParameters.paymentMode = PaymentMode().cc
        requestParameters.terminalId = ""
        requestParameters.merchantTransactionId = "randomnumber265"
        requestParameters.amount = "50.00"
        requestParameters.currency = "USD"
        requestParameters.toType = "docspartner"
        requestParameters.paymentBrand = PaymentBrand().visa
        requestParameters.merchantRedirectUrl = "www.merchantredirecturl.com"
        requestParameters.tmplAmount = "50.00"
        requestParameters.tmplCurrency = "USD"
        requestParameters.orderDescription = "Test"
        requestParameters.country = "IN"
        requestParameters.state = "MH"
        requestParameters.street = "Malad"
        requestParameters.city = "Mumbai"
        requestParameters.email = "savitha.m@xyz.com"
        requestParameters.postCode = "400064"
        requestParameters.telnocc = "+91"
        requestParameters.phone = "9096831666"
        requestParameters.hostUrl = "https://testurl.com/transaction/PayProcessController"
        
        let standardCheckout = StandardCheckout(viewController: self)
        standardCheckout.initPayment(requestParameters: requestParameters, standardCheckoutDelegate: self, secureKey: secureKey)
    }

    // Delegate methods is where you will receive the payment result
    func onSuccess(standardCheckoutResult: StandardCheckoutResult) {
        let resultViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultViewController.standardCheckoutResult = "Tracking Id: "+standardCheckoutResult.trackingId!+", Amount: "+standardCheckoutResult.amount!+", Description: "+standardCheckoutResult.desc!+", Status: "+standardCheckoutResult.status!+", Descriptor: "+standardCheckoutResult.descriptor!
        let resultNavigationController: UINavigationController = UINavigationController(rootViewController: resultViewController)
        self.present(resultNavigationController, animated: true, completion: nil)
    }
    
    func onFail() {
        let alert = UIAlertController(title: "Fail", message: "Fail transaction", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

