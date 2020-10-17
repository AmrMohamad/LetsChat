//
//  LoginViewController.swift
//  LetsChat
//
//  Created by Amr Mohamad on 10/17/20.
//  Copyright © 2020 Amr Mohamad. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        if let email = emailTextField.text , let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alertControllerOK = UIAlertController.init(title: "Someting Wrong", message: e.localizedDescription , preferredStyle: .alert)
                    
                    let oKAction = UIAlertAction(title: "Ok", style: .default)
                    { _ in
                       // self.navigationController?.popToRootViewController(animated: true)
                    }
                    
                    alertControllerOK.addAction(oKAction)
                    self.present(alertControllerOK, animated: true, completion:  nil)
                    
                    print(e)
                } else{
//                    let storyboard = UIStoryboard(name: "Chat", bundle: nil)
//                    let vc = storyboard.instantiateViewController(withIdentifier: "NavChatViewController")
//                    vc.modalPresentationStyle = .fullScreen
//                    self.navigationController?.pushViewController(vc, animated: true)
//                    self.navigationController?.isNavigationBarHidden = true
//                    let chatPage = self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
//                    self.navigationController?.pushViewController(chatPage, animated: true)
                }
            }
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
