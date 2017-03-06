//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Noi-Ariella Baht Israel on 3/3/17.
//  Copyright © 2017 Plant A Seed of Code. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {
    @IBOutlet var imageView: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func imageSelected(name: String) {
        imageView.image = NSImage(named: name)
    }
    
}
