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
    var conName: String = ""
    
    let ff = Firestore.firestore()
    var conversations:[Conversation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ConversationCell", bundle: nil), forCellReuseIdentifier: "ConversationCell")

        // Do any additional setup after loading the view.
        loudConversations()
    }
    
    func loudConversations(){
        ff.collection("conversations").addSnapshotListener{ (querySnapshot, error) in
            self.conversations = []
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            }else{
                if let snapshotDoc = querySnapshot?.documents {
                    for doc in snapshotDoc{
                        let conversationData = doc.data()
                        if let conversationName = conversationData["conversationName"] as? String {
                            let newConversation = Conversation(conversationName: conversationName)
                            self.conversations.append(newConversation)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
                    
            }
            
        }

    }
    
    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
    }
    
    
    @IBAction func createConversation(_ sender: UIBarButtonItem) {
        let alertControllerCC = UIAlertController.init(title: "Create Chat", message: "++++++++++", preferredStyle: .alert)
        alertControllerCC.addTextField { (_ textField: UITextField) in
            textField.placeholder = "Enter the name of your friend"
//            self.conName = textField.text
        }
        let createAction = UIAlertAction(title: "LET'S CHAT✊🏻", style: .default)
        { _ in
//            let conName = alertControllerCC.textFields?.first?.text ?? "no Data"
            self.conName = alertControllerCC.textFields?.first?.text ?? "no Data"
            
             let conversationName = self.conName //{
            
                self.ff.collection("conversations").addDocument(data: [
                    "conversationName" : conversationName
                ]){ (error) in
                    if let e = error{
                        print("There was an issue saving data to firestore \(e)")
                    }else{
                        print("Everything is fuckin good")
                        print(self.conName)
                    }
                    
                }
                
//            }


        }
        
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
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let conversation = conversations[indexPath.row]
        let conversationCell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath) as! ConversationCell
        conversationCell.nameOfRecipient.text = conversation.conversationName
        
        return conversationCell
    }
    
    
}
