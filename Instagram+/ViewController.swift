/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit
import AssetsLibrary

class ViewController: UIViewController {
    
    var library = ALAssetsLibrary()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func saveImageToAlbum() {
//        let image = UIImage(named: "your_image_name")!
//        library.writeImageToSavedPhotosAlbum(image.CGImage, orientation: ALAssetOrientation(rawValue: image.imageOrientation.rawValue)!, completionBlock:saveDone)
//        }
//    }
//
//    func saveDone(assetURL:NSURL!, error:NSError!){
//        print("saveDone")
//        library.assetForURL(assetURL, resultBlock: self.saveToAlbum, failureBlock: nil)
//    
//    }
//
//    func saveToAlbum(asset:ALAsset!){
//    
//        library.enumerateGroupsWithTypes(ALAssetsGroupAlbum, usingBlock: { group, stop in
//            stop.memory = false
//            if(group != nil){
//                let str = group.valueForProperty(ALAssetsGroupPropertyName) as! String
//                if(str == "MY_ALBUM_NAME"){
//                    group!.addAsset(asset!)
//                    let assetRep:ALAssetRepresentation = asset.defaultRepresentation()
//                    let iref = assetRep.fullResolutionImage().takeUnretainedValue()
//                    let image:UIImage =  UIImage(CGImage:iref)!
//                
//            }
//            
//        }
//        
//        },
//        failureBlock: { error in println("NOOOOOOO")
//    })
//    
//}
//    @IBAction func savePhoto(sender: AnyObject) {
//        // 1
//        let imageToSave = filter.outputImage
//        
//        // 2
//        let softwareContext = CIContext(options:[kCIContextUseSoftwareRenderer: true])
//        
//        // 3
//        let cgimg = softwareContext.createCGImage(imageToSave, fromRect:imageToSave.extent())
//        
//        // 4
//        let library = ALAssetsLibrary()
//        library.writeImageToSavedPhotosAlbum(cgimg,
//                                             metadata:imageToSave.properties(),
//                                             completionBlock:nil)
//    }
}
    




