//
//  WelcomeViewController.swift
//  LetsChat
//
//  Created by Amr Mohamad on 10/16/20.
//  Copyright © 2020 Amr Mohamad. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleTextWelcomeScreen: CLTypingLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextWelcomeScreen.text = "👋🏻 LetsChat"
        

        // Do any additional setup after loading the view.
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
