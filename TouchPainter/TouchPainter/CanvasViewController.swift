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

}
