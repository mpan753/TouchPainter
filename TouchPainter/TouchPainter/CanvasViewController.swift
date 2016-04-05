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
    
    var startPoint : CGPoint?
    @IBOutlet var coordinatingController: CoordinatingController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaultGenerator = CanvasViewGenerator()
        self.loadCanvasViewWithGenerator(defaultGenerator)
        
        scribble = Scribble()
//        scribble?.addObserver(self, forKeyPath: "mark", options:.New, context: &myContext)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"observeValueChangeForMark:", name:didChangeValueForMarkNotification, object:nil)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let red = userDefaults.floatForKey("red")
        let green = userDefaults.floatForKey("green")
        let blue = userDefaults.floatForKey("blue")
        strokeColor = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1)
        strokeSize = userDefaults.floatForKey("size")
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
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

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch : UITouch = touches.first!
        startPoint = touch.locationInView(self.canvasView)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch : UITouch = touches.first!
        let previousPoint = touch.previousLocationInView(self.canvasView)
        if CGPointEqualToPoint(startPoint!, previousPoint) {
            let stroke = Stroke()
            stroke.color = strokeColor
            stroke.size = strokeSize
            scribble?.addMark(stroke, shouldAddToPreviousMark: false)
        }
        let currentPoint = touch.locationInView(self.canvasView)
        let vertex = Vertex(location: currentPoint)
        scribble?.addMark(vertex, shouldAddToPreviousMark: true)
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch : UITouch = touches.first!
        let currentPoint: CGPoint = touch.locationInView(self.canvasView)
        if CGPointEqualToPoint(startPoint!, currentPoint) {
            let dot = Dot(color: strokeColor!, size: strokeSize!)
            scribble?.addMark(dot, shouldAddToPreviousMark: false)
        }
        startPoint = CGPointZero
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        startPoint = CGPointZero
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
//        if object?.isKindOfClass(Scribble) == true && keyPath! == "mark" {
//        if context == &myContext {
//            if let mark = change?[NSKeyValueChangeNewKey] {
//                print(mark)
//                canvasView?.mark = mark as? Mark
//                canvasView?.setNeedsDisplay()
//            }
//        }
    }
    
    
    
    @IBAction func onBarButtonHit(sender: UIBarButtonItem) {
        if sender.tag == 4 {
            undoManager?.undo()
        } else if sender.tag == 5 {
            undoManager?.redo()
        }
    }

    @IBAction func onCustomBarButtonHit(sender: CommandBarButton) {
        sender.command?.execute()
    }

    func observeValueChangeForMark(note : NSNotification) {
//        print("\(__FUNCTION__)")
        let mark = note.userInfo!["mark"] as! Mark
        canvasView?.mark = mark
        canvasView?.setNeedsDisplay()
    }
    
}
