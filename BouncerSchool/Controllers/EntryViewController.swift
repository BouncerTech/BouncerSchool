//
//  ViewController.swift
//  SwiftCollectionViews
//
//  Created by Andrew Kestler on 2/8/22.
//

import UIKit
import Firebase

class EntryViewController: UIViewController {
    
    var loginButton: Button!
    var signUpButton: Button!
    let secondVC = SecondViewController()
    
    let userResponseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .cyan
        return label
    }()
    
    var emailTextField: TextField!
    var passwordTextField: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .greyColor()
        
        ///For dismissing keyboard on screen tap:
        ///We add a gesture recognizer to the whole view
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissAKeyboard))
        view.addGestureRecognizer(tap)
        
        ///Add response label with no text ---- Set Dimensions & Anchor
        view.addSubview(userResponseLabel)
        userResponseLabel.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: .makeHeight(150))
        
        
        ///Creates Email Text Field  ---- Set Dimensions / Anchor
        emailTextField = TextField(vc: self, text: "Email", isSecure: false)
        emailTextField.setDimensions(height: .makeHeight(40), width: .makeWidth(290))
        emailTextField.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: .makeHeight(350))
        
        
        ///Creates Password Text Field ---- Set Dimensions / Anchor
        passwordTextField = TextField(vc: self, text: "Password", isSecure: true)
        passwordTextField.setDimensions(height: .makeHeight(40), width: .makeWidth(290))
        passwordTextField.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: .makeHeight(450))

        
        ///Creates Login Button w/ 'loginPressed' action  ---- Sets Dimensions / Anchor / Symbol Color /  Font Size
        loginButton = Button(vc: self, action: #selector(loginPressed(sender:)), bgColor: .lightGreyColor(), borderColor: .blueMinty(), cornerRadius: .makeHeight(20), text: "Login", symbol: "text.append")
        loginButton.setDimensions(height: .makeHeight(60), width: .makeWidth(300))
        loginButton.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: .makeHeight(600))
        loginButton.tintColor = .white
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        
        ///Creates Sign Up Button w/ 'signUpPressed' action ---- Sets Dimensions / Anchor / Symbol Color /  Font Size
        signUpButton = Button(vc: self, action: #selector(signUpPressed(sender:)), bgColor: .lightGreyColor(), borderColor: .blueMinty(), cornerRadius: .makeHeight(20), text: "Create Account", symbol: "pencil.tip")
        signUpButton.setDimensions(height: .makeHeight(60), width: .makeWidth(300))
        signUpButton.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: .makeHeight(700))
        signUpButton.tintColor = .white
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }
    
        
    @objc func dismissAKeyboard() {
        view.endEditing(true)
    }
    
    @objc func loginPressed(sender: UIButton){
        guard let emailText = emailTextField.text else {
            userResponseLabel.text = "No Email given 🤨"
            return
        }
        
        guard let passwordText = passwordTextField.text else{
            userResponseLabel.text = "No Password given 😕"
            return
        }
        
        //*Documentation Refrence:
        ///'https://firebase.google.com/docs/auth/ios/password-auth#sign_in_a_user_with_an_email_address_and_password'
        Auth.auth().signIn(withEmail: emailText, password: passwordText) { [self] result, e in
            if let e = e{
                print(e.localizedDescription)
            }
            
            if let email = result?.user.email{
                userResponseLabel.text = "Welcome back, \(email). 🤗"
                
                //This pauses code for 1.5 secs
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    //This code takes you to a new screen
                    navigationController?.pushViewController(secondVC, animated: true)
                }
                
            }else{
                userResponseLabel.text = "Failed to sign in 🥲"
                view.addSubview(userResponseLabel)
                userResponseLabel.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: .makeHeight(150))
            }
        }
    }
    
    
    @objc func signUpPressed(sender: UIButton){
        guard let emailText = emailTextField.text else {
            userResponseLabel.text = "No Email given 🤨"
            return
        }
        
        guard let passwordText = passwordTextField.text else{
            userResponseLabel.text = "No Password given 😕"
            return
        }
        
        //*Documentation Refrence:
        ///'https://firebase.google.com/docs/auth/ios/password-auth#create_a_password-based_account'
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { [self] result, e in
            if let e = e{
                print(e.localizedDescription)
            }
            
            if let email = result?.user.email{
                userResponseLabel.text = "Thanks for signing up, \(email) 😇"
                view.addSubview(userResponseLabel)
                userResponseLabel.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: .makeHeight(150))
                
                //This pauses code for 1.5 secs
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    //This code takes you to a new screen
                    navigationController?.pushViewController(secondVC, animated: true)
                }
                
            }else{
                userResponseLabel.text = "Failed to create account 😭"
                view.addSubview(userResponseLabel)
                userResponseLabel.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: .makeHeight(150))
            }
        }
    }
}

