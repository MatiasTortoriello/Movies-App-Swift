//
//  ViewController.swift
//  MoviesProject
//
//  Created by Infinixsoft on 11/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var alertLabel: UILabel!
    
    @IBAction func loginButtonPressed() {
        
        if(userName!.text == "MatiasTortoriello" && userPassword!.text == "password123456"){
            
            let destinationViewController = MoviesList()
            
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            
            self.present(destinationViewController, animated: true, completion: nil)
            userPassword.text = ""
            alertLabel.text = ""
        } else {
            alertLabel.text = "Incorrect Username or Password. Please try again."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

