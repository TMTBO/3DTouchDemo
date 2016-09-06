//
//  PreviewViewController.swift
//  3DTouchDemo
//
//  Created by TenmaTobyo on 9/5/16.
//  Copyright © 2016 TenmaTobyo. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    var indexPath = IndexPath()
    
    var bgColor: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = bgColor
        
        let tipLabel = UILabel(frame: view.bounds)
        tipLabel.textAlignment = .center
        tipLabel.numberOfLines = 0
        tipLabel.text = "Here is previewViewController,you pressed \(indexPath.row)th cell"
        
        view.addSubview(tipLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - 3DTouch preview push up three button
    override var previewActionItems: [UIPreviewActionItem] {
        // button1
        let button1 = UIPreviewAction(title: "button1", style: UIPreviewActionStyle.default, handler: { (action, viewController) in
            print("----------button1")
        })
        // button2
        let button2 = UIPreviewAction(title: "button2", style: UIPreviewActionStyle.destructive, handler: { (action, viewController) in
            print("----------button2")
        })
        // button3
        let button3 = UIPreviewAction(title: "button3", style: UIPreviewActionStyle.selected, handler: { (action, viewController) in
            print("----------button3")
        })
        // return an array contain these buttons
        return [button1, button2, button3]
    }
}
