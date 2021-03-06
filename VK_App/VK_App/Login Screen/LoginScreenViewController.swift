//
//  LoginScreenViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 30.03.2021.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    //MARK: - Outlets for view
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextFiled: UITextField!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var vkLogoPathView: VkLogoDraw!
    @IBOutlet weak var vkLogoFillView: VkLogoDraw!
    
    
    
    let loginTextFieldPlaceholder = NSAttributedString(string: "Enter your email or phone number", attributes: [NSAttributedString.Key.foregroundColor : Presets.init().placeholderLightGray])
    let passwordTextFieldPlacegolder = NSAttributedString(string: "Enter your password", attributes: [NSAttributedString.Key.foregroundColor : Presets.init().placeholderLightGray])
    
    let login = ""
    let password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - Design for login screen
        self.view.backgroundColor = Presets.init().vkDarkGray
        
        loginTextField.backgroundColor = Presets.init().vkGray
        loginTextField.textColor = .white
        loginTextField.attributedPlaceholder = loginTextFieldPlaceholder
        loginTextField.adjustsFontSizeToFitWidth = true
        loginTextField.layer.masksToBounds = true
        loginTextField.layer.cornerRadius = 15
        
        passwordTextFiled.backgroundColor = Presets.init().vkGray
        passwordTextFiled.attributedPlaceholder = passwordTextFieldPlacegolder
        passwordTextFiled.textColor = .white
        passwordTextFiled.isSecureTextEntry = true
        passwordTextFiled.layer.masksToBounds = true
        passwordTextFiled.layer.cornerRadius = 15
        
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.titleLabel?.tintColor = .lightText
        forgotPasswordButton.titleLabel?.font = UIFont(name: "Avenir", size: 14)
        
        signInButton.backgroundColor = Presets.init().vkLightGray
        signInButton.layer.cornerRadius = signInButton.layer.bounds.height/2
        signInButton.layer.masksToBounds = true
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.titleLabel?.tintColor = Presets.init().vkGray
        signInButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 18)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.tintColor = .white
        signUpButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 18)
        
        vkLogoPathView.vkLogoLayer.fillColor = UIColor.clear.cgColor
    }
    
    //MARK: - Scrolling for keyboard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let bezierPathLogoAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        bezierPathLogoAnimation.fromValue = 0
        bezierPathLogoAnimation.toValue = 1
        bezierPathLogoAnimation.repeatCount = 1
        bezierPathLogoAnimation.duration = 0.8
        bezierPathLogoAnimation.beginTime = CACurrentMediaTime()
        
        let appearLogoAnimation = CABasicAnimation(keyPath: "opacity")
        appearLogoAnimation.fromValue = 0
        appearLogoAnimation.toValue = 1
        appearLogoAnimation.duration = 0.8
        appearLogoAnimation.beginTime = CACurrentMediaTime() + 0.8
        appearLogoAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        appearLogoAnimation.fillMode = CAMediaTimingFillMode.backwards
    
        vkLogoPathView.vkLogoLayer.add(bezierPathLogoAnimation, forKey: nil)
        vkLogoFillView.layer.add(appearLogoAnimation, forKey: nil)
        
        UIView.animate(withDuration: 0.2) {
            self.loginTextField.frame.size.height *= 2
            self.passwordTextFiled.frame.size.height *= 2
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard () {
        self.scrollView?.endEditing(true)
    }

    
    //MARK: - Sign in function
    func wrongLoginOrPasswordAnimated() {
        
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if passwordTextFiled.text == password && loginTextField.text == login {
            self.performSegue(withIdentifier: "Accccc", sender: self)
        }
        else {
            signInButton.setTitle("Wrong login or password", for: .normal)
        }
    }
    
}

