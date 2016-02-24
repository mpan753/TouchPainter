//
//  PaletteViewController.swift
//  TouchPainter
//
//  Created by Pan Meng on 2/19/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

import UIKit

class PaletteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var coordinatingController: CoordinatingController!
    @IBAction func dismissViewController(sender: AnyObject) {
        coordinatingController.requestViewChangeByObject(sender)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
