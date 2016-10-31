//
//  LayoutViewController.swift
//  Instagram+
//
//  Created by Amanda McMaster on 9/16/16.
//  Copyright © 2016 McMaster. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagesDirectoryPath:String!
    var images:[UIImage]!
    var titles:[String]!
    
    @IBOutlet weak var imageView0: UIImageView!
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var imageView5: UIImageView!
    
    @IBOutlet weak var imageView6: UIImageView!
    
    @IBOutlet weak var imageView7: UIImageView!
    
    @IBOutlet weak var imageView8: UIImageView!
    
    @IBOutlet weak var imageView9: UIImageView!
    
    @IBOutlet weak var imageView10: UIImageView!
    
    @IBOutlet weak var imageView11: UIImageView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("imageTapped:"))
        imageView2.userInteractionEnabled = true
        imageView2.addGestureRecognizer(tapGestureRecognizer)
        
    
        self.images = []
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        // Get the Document directory path
        let documentDirectoryPath:String = paths[0]
        // Create a new path for the new images folder
        self.imagesDirectoryPath = documentDirectoryPath.stringByAppendingString("/ImagePicker")
        var objcBool:ObjCBool = true
        let isExist = NSFileManager.defaultManager().fileExistsAtPath(imagesDirectoryPath, isDirectory: &objcBool)
        // If the folder with the given path doesn't exist already, create it
        if isExist == false{
            do{
                try NSFileManager.defaultManager().createDirectoryAtPath(imagesDirectoryPath, withIntermediateDirectories: true, attributes: nil)
            }catch{
                print("Something went wrong while creating a new folder")
            }
        }
        do{
            titles = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(imagesDirectoryPath)
            for imageTitle in titles{
            
                let data = NSFileManager.defaultManager().contentsAtPath(imagesDirectoryPath.stringByAppendingString("/\(imageTitle)"))
                let image = UIImage(data: data!)
                self.images.insert(image!, atIndex: 0)
            }
            
        }catch{
            print("Error")
        }
        self.imageView2.image = self.images[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(img: AnyObject){
        self.openPhotoLibraryButton(img)
    }
    
    @IBAction func openPhotoLibraryButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView2.image = image
        var imagePath = NSDate().description
        imagePath = imagePath.stringByReplacingOccurrencesOfString(" ", withString: "")
        imagePath = imagesDirectoryPath.stringByAppendingString("/\(imagePath).png")
        let data = UIImagePNGRepresentation(image)
        //let addedImage = UIImage(data: data!)
        self.images.insert(image, atIndex: 0)//adding image to collection
        self.titles.insert(imagePath, atIndex: 0)
        NSFileManager.defaultManager().createFileAtPath(imagePath, contents: data, attributes: nil)
        self.dismissViewControllerAnimated(true, completion: nil);
       
    }
    
   
    func imagePlacer(){
        do{
            images.removeAll()
            titles = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(imagesDirectoryPath)
            for image in titles{
                let data = NSFileManager.defaultManager().contentsAtPath(imagesDirectoryPath.stringByAppendingString("/\(image)"))
                let image = UIImage(data: data!)
                images.append(image!)
            }
            self.imageView0.image = images[0]
            self.imageView1.image = images[1]
            self.imageView2.image = images[2]
            self.imageView3.image = images[3]
            self.imageView4.image = images[4]
            self.imageView5.image = images[5]
            self.imageView6.image = images[6]
            self.imageView7.image = images[7]
            self.imageView8.image = images[8]
            self.imageView9.image = images[9]
            self.imageView10.image = images[10]
            self.imageView11.image = images[11]
            
        }catch{
            print("Error")
        }
    }
    
  //Users/AmandaMac/Library/Developer/CoreSimulator/Devices/5A641AD9-89CD-47FD-936D-07EABF3FB684/data/Containers/data/Application/3B0D84A1-3743-40AB-9AD2-425A5CF0F8D9/Documents/ImagePicker
}



