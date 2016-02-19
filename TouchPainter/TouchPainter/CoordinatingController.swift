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
        canvasViewController = CanvasViewController(nibName: "CanvasViewController", bundle:nil)
        activeViewController = canvasViewController
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
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

    @IBAction func requestViewChangeByObject(object:AnyObject) {
        if object.isKindOfClass(UIBarButtonItem) {
            switch ButtonTag.RawValue(object.tag) {
            case ButtonTag.kButtonTagOpenPaletteView.rawValue:
                let controller = PaletteViewController()
                canvasViewController?.presentViewController(controller, animated: true, completion: nil)
                activeViewController = controller
                break
            case ButtonTag.kButtonTagOpenThumbnailView.rawValue:
                let controller = ThumbnailViewController()
                canvasViewController?.presentViewController(controller, animated: true, completion: nil)
                activeViewController = controller
                break
            default:
                
                break
            }
        }
    }
    
}
