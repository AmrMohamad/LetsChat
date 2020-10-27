//
//  ConversationViewController.swift
//  LetsChat
//
//  Created by Amr Mohamad on 10/17/20.
//  Copyright © 2020 Amr Mohamad. All rights reserved.
//

import UIKit
import Firebase

class ConversationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ConversationCell", bundle: nil), forCellReuseIdentifier: "ConversationCell")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
//            vc.modalPresentationStyle = .automatic
//            self.navigationController?.pushViewController(vc, animated: true)
//            navigationController.
//                //self.navigationController?.isNavigationBarHidden = true
//            vc.navigationItem.hidesBackButton = true
            
//            let welcomePage = storyboard.instantiateViewController(identifier: "WelcomeViewController") as! WelcomeViewController
//            self.navigationController?.pushViewController(welcomePage, animated: true)
            dismiss(animated: true, completion: nil)
        
            
                    
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
    }
    
    
    @IBAction func createConversation(_ sender: UIBarButtonItem) {
        let alertControllerCC = UIAlertController.init(title: "Create Chat", message: "++++++++++", preferredStyle: .alert)
        alertControllerCC.addTextField { (_ textField: UITextField) in
            textField.placeholder = "Enter the name of your friend"
        }
        let createAction = UIAlertAction(title: "LET'S CHAT✊🏻", style: .default, handler: nil)
//        { _ in
//            <#code#>
//        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertControllerCC.addAction(createAction)
        alertControllerCC.addAction(cancelAction)
        self.present(alertControllerCC, animated: true, completion: nil)
        
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

extension ConversationViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let conversationCell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath) as! ConversationCell
        return conversationCell
    }
    
    
}
