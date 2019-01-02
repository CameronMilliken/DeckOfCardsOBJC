//
//  CardViewController.swift
//  DeckOfCardsC
//
//  Created by Cameron Milliken on 1/1/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    //Outlets
    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBOutlet weak var suitLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //Action
    
    @IBAction func cardButtonTapped(_ sender: Any) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        DVMCardController.fetchCard { (card) in
            guard let card = card else {return}
            DVMCardController.fetchCardImage(with: card, completion: { (image) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.cardImageView.image = image
                }
            })
        }
    }
    


}
