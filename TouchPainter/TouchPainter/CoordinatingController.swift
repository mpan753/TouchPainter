//
//  CoordinatingController.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/19/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

enum ButtonTag : Int {
    case kButtonTagDone
    case kButtonTagOpenPaletteView
    case kButtonTagOpenThumbnailView
}

class CoordinatingController: UIViewController {
    
    var canvasViewController:CanvasViewController?
    var activeViewController:UIViewController?
    
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        canvasViewController = CanvasViewController()
        activeViewController = canvasViewController
    }

    class var sharedCoordinator:CoordinatingController {
        struct Static {
            static let instance:CoordinatingController = CoordinatingController()
        }
        return Static.instance
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//    func requestViewChangeByObject(sender: AnyObject) {
//        print("\(__FUNCTION__)")
//    }
    @IBAction func requestViewChangeByObject(object:AnyObject) {
        if object.isKindOfClass(UIBarButtonItem) {
            switch ButtonTag.RawValue(object.tag) {
            case ButtonTag.kButtonTagOpenPaletteView.rawValue:

                let controller = PaletteViewController()
                if let vc = UIApplication.sharedApplication().keyWindow!.rootViewController {
                    vc.presentViewController(controller, animated: true, completion: nil)
                }
                activeViewController = controller
            case ButtonTag.kButtonTagOpenThumbnailView.rawValue:

                let controller = ThumbnailViewController()
                if let vc = UIApplication.sharedApplication().keyWindow!.rootViewController {
                    vc.presentViewController(controller, animated: true, completion: nil)
                }
                activeViewController = controller
            default:
                if let vc = UIApplication.sharedApplication().keyWindow!.rootViewController {
                    vc.dismissViewControllerAnimated(true, completion: nil)
                }
                activeViewController = canvasViewController
            }
        } else {
            if let vc = UIApplication.sharedApplication().keyWindow!.rootViewController {
                vc.dismissViewControllerAnimated(true, completion: nil)
            }
            activeViewController = canvasViewController
        }
    }
    
}
