//
//  ViewController.swift
//  StripeIntegration
//
//  Created by Abhishek on 09/04/18.
//  Copyright © 2018 Marvel. All rights reserved.
//

import UIKit
import Stripe

class ViewController: UIViewController, STPPaymentCardTextFieldDelegate {

    var txtField = STPPaymentCardTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         STPPaymentConfiguration.shared().publishableKey = "pk_test_CUWfOTkei6mGl4JZJ3Y4VI6g"
        // Do any additional setup after loading the view, typically from a nib.
        // Setup payment card text field
        txtField.delegate = self
        txtField.frame = CGRect(x: 10, y: 100, width: 300, height: 50)
        view.addSubview(txtField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func call(_ sender: UIButton) {
        self.setup()
    }

    func setup() {
    

        let cardParams = STPCardParams()
        cardParams.number = txtField.cardNumber//"4242424242424242"
        cardParams.expMonth = txtField.expirationMonth//10
        cardParams.expYear = txtField.expirationYear//2018
        cardParams.cvc = txtField.cvc//"123"
        
        STPAPIClient.shared().createToken(withCard: cardParams) { (token: STPToken?, error: Error?) in
            
            print(token)
            print(error)
            guard let token = token, error == nil else { return }
            
//            submitTokenToBackend(token, completion: { (error: Error?) in
//                if let error = error {
//                    // Present error to user...
//                }
//                else {
//                    // Continue with payment...
//                }
//            })
        }
    }
}
