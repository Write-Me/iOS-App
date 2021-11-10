//
//  Animation.swift
//  WriteMe
//
//  Created by Vladimir Mikhaylov on 03.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

class Animation {

    static let share = Animation()

    let impact = UIImpactFeedbackGenerator(style: UIImpactFeedbackGenerator.FeedbackStyle.light)

    @objc func easeInOut(out: Bool, view: UIView, scale: CGFloat = 1.2) {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: out ? .curveEaseOut : .curveEaseIn, animations: {
            let scale: CGFloat = out ? 1.0 : scale
            view.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: nil)
    }

    @objc func pickAndPop(view: UIView, impact: Bool = true) {
        UIView.animate(withDuration: 0.07, animations: {
            view.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
        }, completion: { (_) in
            UIView.animate(withDuration: 0.07, animations: {
                view.transform = CGAffineTransform.identity
            })
            if impact {
                self.impact.impactOccurred()
            }
        })
    }

    @objc func bounce(view: UIView, offset: CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            view.frame.origin.y -= offset
        }) { (_) in
            UIView.animate(withDuration: 1.0, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.repeat, .autoreverse], animations: {
                view.frame.origin.y += offset
            }, completion: nil)
        }

    }

    @objc func shake(view: UIView) {
        UIView.animate(withDuration: 0.05, delay: 0, options: .curveEaseIn, animations: { () -> Void in
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.6
            animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
            view.layer.add(animation, forKey: "shake")
        }, completion: nil)
    }

}
