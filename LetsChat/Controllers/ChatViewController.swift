//
//  ChatViewController.swift
//  LetsChat
//
//  Created by Amr Mohamad on 10/16/20.
//  Copyright © 2020 Amr Mohamad. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendAction(_ sender: UIButton) {
    }
    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
    
        do {
                  try Auth.auth().signOut()
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
                    vc.modalPresentationStyle = .automatic
                    self.navigationController?.pushViewController(vc, animated: true)
        //            self.navigationController?.isNavigationBarHidden = true
                    
                } catch let signOutError as NSError {
                  print ("Error signing out: %@", signOutError)
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
