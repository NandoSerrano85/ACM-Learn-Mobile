//
//  RegistrationViewController.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 12/3/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordConfirmationTextField: UITextField!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var signIn: UIButton!
    
    @IBOutlet var profileImage: UIImageView!
    
    var auth: AuthAPI!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageSetup()
    }
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if passwordTextField.text == passwordConfirmationTextField.text {
            self.performSegue(withIdentifier: "SentimentForm", sender: self)
        } else {
            print("error")
        }
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SwitchToLogin", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SwitchToLogin" {
            let loginController = segue.destination as! LoginViewController
            loginController.auth = self.auth
        } else if segue.identifier == "SentimentForm" {
            let profileSentimentController = segue.destination as! ProfileSentiment
            let incomplete: [String:Any] = ["fname":firstName.text!, "lname": lastName.text!, "email": emailTextField.text!, "password":passwordTextField.text!, "image":profileImage.image!]
            profileSentimentController.auth = self.auth
            profileSentimentController.incomplete = incomplete
            
            
        }
    }
    func imageSetup(){
        profileImage.layer.cornerRadius = 120
        profileImage.clipsToBounds = true
        let tapProfileImage = UITapGestureRecognizer(target: self, action: #selector(pressedImage))
        profileImage.addGestureRecognizer(tapProfileImage)
        
    }
    
    @objc func pressedImage() {
        let picker = UIImagePickerController()
//        picker.sourceType = .photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileImage.image = imageSelected
        } else if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.image = imageOriginal
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
