//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Michael Bock on 3/5/16.
//  Copyright © 2016 Michael R. Bock. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!

    var contentViewOriginalCenter: CGPoint = CGPoint(x: 0, y: 0)
    var gestureLocation: CGPoint = CGPoint(x: 0, y: 0)

    var profileImage: UIImage? {
        get {
            return profileImageView.image
        }
        set(newProfileImage) {
            profileImageView.image = newProfileImage
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }

    @IBAction func onPanGesture(sender: UIPanGestureRecognizer) {
        if sender.state == .Began {
            contentViewOriginalCenter = contentView.center
            gestureLocation = sender.locationInView(contentView)
        } else if sender.state == .Changed {
            let translation = sender.translationInView(superview)
            let velocity = sender.velocityInView(superview)
            var gestureTop = false
            if gestureLocation.y < 200 {
                gestureTop = true
            }
            if (velocity.x < 0 && translation.x >= -50) || (velocity.x > 0 && translation.x <= 50) {
                contentView.center = CGPoint(x: contentViewOriginalCenter.x + translation.x, y: contentViewOriginalCenter.y)
                var degreesToRotate = 0.4 * translation.x
                if !gestureTop {
                    degreesToRotate = -1 * degreesToRotate
                }
                let radiansToRotate = degreesToRotate.degreesToRadians.cgFloatValue
                contentView.transform = CGAffineTransformMakeRotation(radiansToRotate)
            } else {  // Animate off screen.
                if velocity.x < 0 {  // Left.
                    UIView.animateWithDuration(0.4, animations: { () -> Void in
                        self.contentView.center = CGPoint(x: self.contentViewOriginalCenter.x - 350, y: self.contentViewOriginalCenter.y)
                    })
                } else {  // Right.
                    UIView.animateWithDuration(0.4, animations: { () -> Void in
                        self.contentView.center = CGPoint(x: self.contentViewOriginalCenter.x + 350, y: self.contentViewOriginalCenter.y)
                    })
                }
            }
        } else if sender.state == .Ended {
            let translation = sender.translationInView(superview)
            let velocity = sender.velocityInView(superview)
            if (velocity.x < 0 && translation.x >= -50) || (velocity.x > 0 && translation.x <= 50) {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.contentView.center = self.contentViewOriginalCenter
                    self.contentView.transform = CGAffineTransformIdentity
                })
            }
        }
    }
}
