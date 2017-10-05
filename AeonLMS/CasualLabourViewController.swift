//
//  CasualLabourViewController.swift
//  AeonLMS
//
//  Created by Mike Frellerer on 8/18/16.
//  Copyright © 2016 Mike. All rights reserved.
//

import UIKit

class CasualLabourViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    // MARK: - IBOutlet

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNRIC: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var txtWorkDate: UITextField!
    @IBOutlet weak var txtWorkHours: UITextField!
    @IBOutlet weak var txtWageType: UITextField!
    @IBOutlet weak var imgNRICFront: UIImageView!
    @IBOutlet weak var imgNRICBack: UIImageView!
    @IBOutlet weak var imgPaymentSlip: UIImageView!
    @IBOutlet weak var imgSignature: UIImageView!
    @IBOutlet weak var btnNRICFront: UIButton!
    @IBOutlet weak var btnNRICBack: UIButton!
    @IBOutlet weak var btnPaySlip: UIButton!
    @IBOutlet weak var btnSign: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    
    // MARK: - Properties
    
    var imagePicker: UIImagePickerController!
    var datePicker: UIDatePicker!
    var tapGesture: UITapGestureRecognizer!
    var photoType: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize UIImagePickerController
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
        }
        
        // Set UIDatePicker for WorkDate TextField
        datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.date
        txtWorkDate.inputView = datePicker
        
        // Initialize UITapGestureRecognizer
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {

        txtWorkDate.endEditing(true)
        txtWorkHours.endEditing(true)
        txtWageType.endEditing(true)
    }

    
    // MARK: - IBActions

    @IBAction func onBtnBack(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnNRICFront(_ sender: AnyObject) {
        
        photoType = 1
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onBtnNRICBack(_ sender: AnyObject) {

        photoType = 2
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onBtnPaymentSlip(_ sender: AnyObject) {

        photoType = 3
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onBtnSign(_ sender: AnyObject) {
        
    }
    
    @IBAction func onBtnDone(_ sender: AnyObject) {
        
    }
    
    
    // MARK: - UIImagePickerController Delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        if photoType == 1 {
            imgNRICFront.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            btnNRICFront.setTitle("", for: UIControlState())
        }
        else if photoType == 2 {
            imgNRICBack.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            btnNRICBack.setTitle("", for: UIControlState())
        }
        else if photoType == 3 {
            imgPaymentSlip.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            btnPaySlip.setTitle("", for: UIControlState())
        }
    }
}
