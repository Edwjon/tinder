//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    
    
    @IBAction func signUpFacebook(sender: UIButton)
    {
        let permissions = ["public_profile"]
        
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions, block: {
            
            (user: PFUser?, error: NSError?) -> Void in
            
            if let error = error {
                
                print(error)
                
            } else {
                
                if let user = user {
                    
                    if let interestedInWomen = user["interestedInWomen"] {
                        
                        self.performSegueWithIdentifier("toLogIn", sender: self)
                        
                    } else {
                        
                    self.performSegueWithIdentifier("hola", sender: self)
                        
                    }
                    
                }
            }
            
        })

        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        
        if let username = PFUser.currentUser()?.username {
            
            if let interestedInWomen =  PFUser.currentUser()?["interestedInWomen"] {
                
                self.performSegueWithIdentifier("toLogIn", sender: self)
                
            } else {
                
                self.performSegueWithIdentifier("hola", sender: self)
                
            }
        }
    }
    
    
    
    
    
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

