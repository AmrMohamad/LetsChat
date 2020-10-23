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
    
    let db = Firestore.firestore()
    
    
    var messages: [Message] = [
        Message(sender: "test1@mail.com", body: "Hi!"),
        Message(sender: "test2@mail.com", body: "Hi !")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.appName
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessageCell")

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func sendAction(_ sender: UIButton) {
        if let messageBody = messageTextField.text , let messageSender = Auth.auth().currentUser?.email {
            db.collection("messages").addDocument(data: [
                "sender" : messageSender,
                "body"   : messageBody
            ]) { (error) in
                if let e = error{
                    print("There was an issue saving data to firestore \(e)")
                }else{
                    print("Everything is fuckin good")
                }
            }
        }
    }
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let welcomeScreen = storyboard.instantiateViewController(identifier: "WelcomeViewController") //as! WelcomeViewController
//            welcomeScreen.modalPresentationStyle = .fullScreen
//            welcomeScreen.navigationController?.navigationItem.hidesBackButton = false
//            welcomeScreen.navigationController?.navigationBar.prefersLargeTitles = true
//            self.present(welcomeScreen, animated: true, completion: nil)
            
            
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
//            vc.modalPresentationStyle = .automatic
//            self.navigationController?.pushViewController(vc, animated: true)
                //self.navigationController?.isNavigationBarHidden = true
//            vc.navigationItem.hidesBackButton = true
        
                
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

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.messageBody.text = messages[indexPath.row].body
        return cell
    }
    
    
}
