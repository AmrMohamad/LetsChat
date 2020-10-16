//
//  RegisterViewController.swift
//  LetsChat
//
//  Created by Amr Mohamad on 10/16/20.
//  Copyright © 2020 Amr Mohamad. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerAction(_ sender: Any) {
        
        if passwordTextField.text == confirmTextField.text {
            
            if let email = emailTextField.text , let password = passwordTextField.text{
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        
                        let alertControllerOK = UIAlertController.init(title: "Someting Wrong", message: e.localizedDescription , preferredStyle: .alert)
                        
                        let oKAction = UIAlertAction(title: "Ok", style: .default)
                        { _ in
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                        
                        alertControllerOK.addAction(oKAction)
                        self.present(alertControllerOK, animated: true, completion:  nil)
                        
                        print(e.localizedDescription)
                    } else{
                        self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                    }
                }
            }
            
        } else {
            
            let alertControllerOK = UIAlertController.init(title: "Someting Wrong", message: "It's not the same password Please,Check your Password again  ", preferredStyle: .alert)
            
            let oKAction = UIAlertAction(title: "Ok", style: .default)
            { _ in
                self.navigationController?.popToRootViewController(animated: true)
            }
            
            alertControllerOK.addAction(oKAction)
            self.present(alertControllerOK, animated: true, completion:  nil)

            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
