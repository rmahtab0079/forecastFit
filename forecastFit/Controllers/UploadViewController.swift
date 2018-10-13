//
//  UploadViewController.swift
//  forecastFit
//
//  Created by Matthew on 10/13/18.
//  Copyright © 2018 Rageeb Mahtab. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController {

    @IBOutlet weak var uploadImage: UIImageView!
    @IBOutlet weak var downloadImage: UIImageView!
    
    let filename = "upload.jpg"
    
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadImage.contentMode = .scaleAspectFit

    }
    
    @IBAction func onUploadTapped(_ sender: Any) {
        //TODO: upload
        guard let image = uploadImage.image else { return }
        guard let imageData = image.jpegData(compressionQuality: 1) else { return }
        
        let uploadImageRef = imageReference.child(filename)
        
        let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            print(metadata ?? "NO METADATA")
            print(error ?? "NO ERROR")
        }
        
        /*
        let observer = uploadTask.observe(.progress) { snapshot in
            // A progress event occurred
        }
        */
        
        uploadTask.observe(.success) { snapshot in
            // Upload completed successfully
            let alertController = UIAlertController(title: "Success", message: "Photo uploaded to server.", preferredStyle: .alert)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        uploadTask.resume()
    }
    
    @IBAction func onDownloadTapped(_ sender: Any) {
        //TODO: download
        let downloadImageRef = imageReference.child(filename)
        let downloadTask = downloadImageRef.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
            if let data = data {
                let image = UIImage(data: data)
                self.downloadImage.image = image
            }
            print (error ?? "NO ERROR")
        }
        
        downloadTask.resume()
        
    }
    
}


/*
 let alertController = UIAlertController(title: "Missing Fields", message: "Error. Login fields are missing.", preferredStyle: .alert)
 
 // create an OK action
 let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
 // handle response here.
 }
 
 // add the OK action to the alert controller
 alertController.addAction(OKAction)
 present(alertController, animated: true, completion: nil)
 */
