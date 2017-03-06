//
//  SourceViewController.swift
//  StormViewer
//
//  Created by Noi-Ariella Baht Israel on 3/3/17.
//  Copyright © 2017 Plant A Seed of Code. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet var tableView: NSTableView!
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.resourcePath!
        
        let fm = FileManager.default
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.make(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil }
        vw.textField?.stringValue = pictures[row]
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        guard let detailVC = splitVC.childViewControllers[1] as? DetailViewController else { return }
        
        detailVC.imageSelected(name: pictures[tableView.selectedRow])
        
        
    }
        
}


