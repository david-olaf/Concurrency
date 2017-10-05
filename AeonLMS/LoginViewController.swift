//
//  LoginViewController.swift
//  AeonLMS
//
//  Created by David Family on 7/31/16.
//  Copyright © 2016 David. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var txtFieldUserName: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!

    // MARK: - Properties
    
    var jsonArray: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Declare notifications
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // Define Gesture
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        // Set delegates
        txtFieldUserName.delegate = self
        txtFieldPassword.delegate = self
        
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Initialize View

    func initView() {
        
        txtFieldUserName.attributedPlaceholder = NSAttributedString.init(string: "USERNAME", attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
        txtFieldPassword.attributedPlaceholder = NSAttributedString.init(string: "PASSWORD", attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
        btnLogin.backgroundColor = UIColor.darkGray
        btnLogin.isEnabled = false
    }
    
    
    // MARK: - Notification Methods
    
    func keyboardWillShow(_ notification: Notification) {
        
        var info = (notification as NSNotification).userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        UIView.animate(withDuration: 0.5, animations: { 
            self.view.frame = CGRect(x: 0, y: 0 - keyboardFrame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height)
        }) 
    }

    func keyboardWillHide(_ notification: Notification) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        }) 
    }
    
    
    // MARK: - Login Method
    
    func login() {
        
        SVProgressHUD.show()
        
        let AeonConstant = Constant()
        let requestURL = AeonConstant.baseURL + "/signin"
        let parameter = ["username": txtFieldUserName.text!,
                         "password": txtFieldPassword.text!]
        Alamofire.request(requestURL, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
                case .success:
                    SVProgressHUD.showSuccess(withStatus: "Login success!")
                    //let vwController = self.storyboard?.instantiateViewController(withIdentifier: "IDStoryProjects")
                    //self.navigationController?.pushViewController(vwController!, animated: true)
                    break
                case .failure(let error):
                    print(error)
                    SVProgressHUD.showError(withStatus: "Login error!")
                    break
            }
        }
    }
    
    
    // MARK: - UITapGuestureRecognizer Method
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    // MARK: - IBActions
    
    @IBAction func onBtnLogin(_ sender: AnyObject) {
        self.login()
    }
    
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
            case txtFieldUserName:
                txtFieldPassword.becomeFirstResponder()
                break
            case txtFieldPassword:
                self.login()
                break
            default:
                textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if newString.characters.count > 0 && (textField == self.txtFieldPassword &&  self.txtFieldUserName.text?.characters.count > 0) || (textField == self.txtFieldUserName && self.txtFieldPassword.text?.characters.count > 0) {
            
            btnLogin.isEnabled = true
            btnLogin.backgroundColor = UIColor(red: 34.0/255.0, green: 192.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        }
        else {
            btnLogin.isEnabled = false
            btnLogin.backgroundColor = UIColor.darkGray
        }
        
        return true
    }
}

