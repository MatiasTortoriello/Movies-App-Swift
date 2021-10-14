//
//  MoviesPopular.swift
//  MoviesProject
//
//  Created by Infinixsoft on 14/10/2021.
//

import UIKit
import Alamofire

class MoviesPopular: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    

}
