//
//  CanvasViewController.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/18/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    var canvasView:CanvasView?
    var scribble:Scribble?
    var strokeColor:UIColor?
    var strokeSize:Float?
    
    @IBOutlet var coordinatingController: CoordinatingController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultGenerator = CanvasViewGenerator()
        
        // Do any additional setup after loading the view.
        self.loadCanvasViewWithGenerator(defaultGenerator)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCanvasViewWithGenerator(generator:CanvasViewGenerator) {
        self.canvasView?.removeFromSuperview()
        self.canvasView = generator.canvasViewWithFrame(CGRect(x: 0,y: 0,width: 320,height: 436))
        self.view.addSubview(self.canvasView!)
    }

//    @IBAction func requestChangeBtObjecgt(sender: AnyObject) {
//        coordinatingController.requestViewChangeByObject(sender)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
