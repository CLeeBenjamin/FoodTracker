//
//  ViewController.swift
//  FoodTracker
//
//  Created by Caston  Boyd on 4/27/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var photoImage: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
    }
    // MARK: - UITextFieldDegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // Hide the keyboard.//
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        mealNameLabel.text = textField.text
    }
    
    //MARK: - UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else{
            fatalError("Expected a dictionary containing an image, but was provided with the following \(info)")
            
            
        }
        photoImage.image = selectedImage
        dismiss(animated: true, completion: nil)
        
    }
    
    
    //MARK: - Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //this action hides the keyboard
        nameTextField.resignFirstResponder()
        
        //this assign a constant type to an instance of UIImagePicker
        let imagePicker = UIImagePickerController()
       imagePicker.sourceType = .photoLibrary
       imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
   
}

