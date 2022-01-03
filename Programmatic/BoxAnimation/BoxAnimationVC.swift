//
//  BoxAnimationVC.swift
//  Programmatic
//
//  Created by Aditya Mishra on 03/01/22.
//

import UIKit

class BoxAnimationVC: UIViewController {
    var centerConstraint: NSLayoutConstraint? = nil
    var bottomConstraint: NSLayoutConstraint? = nil
    
    let box: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addBox()
    }
    
    override func viewDidLayoutSubviews() {
        animate()                //Animate when
    }
    
    func addBox() {
        self.view.addSubview(box)
        addConstraintsToSubView()
    }
    
    func addConstraintsToSubView() {
        //Following constraints keep box in centre
        box.translatesAutoresizingMaskIntoConstraints = false
        centerConstraint = box.centerYAnchor   .constraint(equalTo: self.view.centerYAnchor)
        bottomConstraint = box.bottomAnchor    .constraint(equalTo: self.view.bottomAnchor)
        box.centerXAnchor   .constraint(equalTo: self.view.centerXAnchor)   .isActive = true
        box.heightAnchor    .constraint(equalToConstant: 100)               .isActive = true
        box.widthAnchor     .constraint(equalToConstant: 100)               .isActive = true
        centerConstraint?.isActive = true
        bottomConstraint?.isActive = false
    }
    
    func animate() {
        UIView.animate(withDuration: 2.0, delay: 1, options: [.repeat, .autoreverse], animations: {
            self.centerConstraint?.isActive = false
            self.bottomConstraint?.isActive = true
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

