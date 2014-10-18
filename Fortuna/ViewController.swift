//
//  ViewController.swift
//  Fortuna
//
//  Created by YCS on 17/10/14.
//  Copyright (c) 2014 ycswaves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuote()
    }
    @IBOutlet weak var quotationTextView: UITextView!
    let delegate = UIApplication.sharedApplication().delegate as AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        quotationTextView.editable = false
        quotationTextView.selectable = false
        displayRandomQuote()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayRandomQuote() {
        let posOrNeg = arc4random_uniform(2)
        var quotes: [String]
        if posOrNeg == 1 {
            quotes = delegate.positiveQuotes
        } else {
            quotes = delegate.negativeQuotes
        }
        let quote = quotes[Int(arc4random_uniform(UInt32(quotes.count)))]
        quotationTextView.text = quote
    }

}

