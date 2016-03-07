//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Michael Bock on 3/6/16.
//  Copyright © 2016 Michael R. Bock. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var navBarImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        initSubViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubViews()
    }

    func initSubViews() {
        let nib = UINib(nibName: "ProfileViewController", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapGesture(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
