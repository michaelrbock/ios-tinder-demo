//
//  ViewController.swift
//  Tinder
//
//  Created by Michael Bock on 3/5/16.
//  Copyright © 2016 Michael R. Bock. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var profileDraggableImageView: DraggableImageView!
    var profileViewController: ProfileViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        profileDraggableImageView.profileImage = UIImage(named: "ryan")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapGesture(sender: UITapGestureRecognizer) {
        profileViewController = ProfileViewController(nibName: "", bundle: nil)
        profileViewController.navBarImageView.image = UIImage(named: "nav_bar2")
        profileViewController.profileImageView.image = UIImage(named: "ryan")
        presentViewController(profileViewController, animated: true, completion: nil)
    }

}

