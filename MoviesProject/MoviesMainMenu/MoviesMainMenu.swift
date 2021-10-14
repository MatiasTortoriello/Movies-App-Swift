//
//  MoviesMainMenu.swift
//  MoviesProject
//
//  Created by Infinixsoft on 14/10/2021.
//

import UIKit
import Alamofire

class MoviesMainMenu: UIViewController {
    
    @IBOutlet weak var topRatedButton: UIButton!
    @IBOutlet weak var popularButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //Navigation
    
    @IBAction func topRatedButtonPressed() {
        let destinationViewController = MoviesList()
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        self.present(destinationViewController, animated: true, completion: nil)
    }
    
    @IBAction func popularButtonPressed() {
        let destinationViewController = MoviesPopular()
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        self.present(destinationViewController, animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
