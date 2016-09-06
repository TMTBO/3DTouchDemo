//
//  ViewController.swift
//  3DTouchDemo
//
//  Created by TenmaTobyo on 9/5/16.
//  Copyright © 2016 TenmaTobyo. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    var cellBgColors: [NSInteger: UIColor]? = {
        let arr = [NSInteger: UIColor]()
        return arr
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        tableView.backgroundColor = UIColor.white
        tableView.register(UITableViewCell().classForCoder, forCellReuseIdentifier: "cell")
        return tableView;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        registerForPreviewing(with: self, sourceView: view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "press to preview safiar"
            return cell
        }
        
        let num = 10 * indexPath.row
        let bgColor = UIColor(red: CGFloat(UInt32(256 - num)) / CGFloat(255.0), green: CGFloat(UInt32(num)) / CGFloat(255.0), blue: CGFloat(UInt32(num)) / CGFloat(255.0), alpha: 1)
        
        cellBgColors?[indexPath.row] = bgColor
        cell.backgroundColor = bgColor
        cell.textLabel?.text = "press to preview previewViewController"
        return cell
    }
    
}

// MARK: - 3DTouch
extension ViewController: UIViewControllerPreviewingDelegate {
    /// press to preview the selelected item
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        // get the indexPath of the pressed location
        let indexPath = tableView.indexPathForRow(at: CGPoint(x: location.x, y: location.y + tableView.contentOffset.y))
        
        // safari preview
        if indexPath?.row == 0 {
            let url = NSURL(string: "http://www.baidu.com")
            let safari = SFSafariViewController(url: url as! URL)
            safari.view.frame = view.bounds
            return safari
        }
        
        let Vc = PreviewViewController()
        Vc.bgColor = cellBgColors?[(indexPath?.row)!]
        Vc.indexPath = indexPath!
        print("----------\(indexPath?.row)")
        return Vc
    }
    /// press deep show the preview controller
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
}


