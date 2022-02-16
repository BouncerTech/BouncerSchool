//
//  PhotoViewController.swift
//  BouncerSchool
//
//  Created by Andrew Kestler on 2/12/22.
//

import Foundation
import UIKit

class PhotoViewController: UIViewController{
    
    var photoButton: Button!
    var finishButton: Button!
    var uid: String!
    
    init(uid: String){
        super.init(nibName: nil, bundle: nil)
        self.uid = uid
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoButton = Button(vc: self, action: #selector(photoTapped(sender:)), bgColor: .greyColor(), borderColor: .blueMinty(), cornerRadius: .makeHeight(50), text: nil, symbol: "photo")
        photoButton.setDimensions(height: .makeHeight(225), width: .makeHeight(225))
        photoButton.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: .makeHeight(155))
        photoButton.tintColor = .blueMinty()
        photoButton.layer.masksToBounds = true
        
        finishButton = Button(vc: self, action: #selector(finishSignUp(sender:)), bgColor: .lightGreyColor(), borderColor: .blueMinty(), cornerRadius: .makeHeight(20), text: "Finish", symbol: nil)
        finishButton.setDimensions(height: .makeHeight(60), width: .makeWidth(300))
        finishButton.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: .makeHeight(700))
    }
    
    @objc func photoTapped(sender: UIButton){
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @objc func finishSignUp(sender: UIButton){
        if let image = photoButton.imageView?.image{
            UserManager.shared.uploadUserImage(image: image, uid: self.uid) { e in
                if let e = e{
                    print("DEBUG: Error uploading image: \(e.localizedDescription)")
                }else{
                    //MARK: MAKE TAB SCREEN
                }
            }
        }
    }
}

extension PhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            self.photoButton.setImage(image, for: .normal)
            picker.dismiss(animated: true)
        }
    }
}
