//
//  GGLoadingView.swift
//  GGLoading
//
//  Created by Anak Mirasing on 5/16/16.
//  Copyright © 2016 iGROOMGRiM. All rights reserved.
//

import UIKit

public class GGLoadingView: UIViewController {

    public struct GGAppearance {
        let kDefaultShadowOpacity: CGFloat
        
        public init(kDefaultShadowOpacity: CGFloat = 0.5) {
           self.kDefaultShadowOpacity = kDefaultShadowOpacity
        }
    }
    
    var appearance: GGAppearance!
    var baseView = UIView()
    private var selfReference: GGLoadingView?
    
    public init() {
        appearance = GGAppearance()
        super.init(nibName:nil, bundle:nil)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName:nibNameOrNil, bundle:nibBundleOrNil)
    }
    
    private func setup() {
        
        // Setup
        view.frame = UIScreen.mainScreen().bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        view.backgroundColor = UIColor(red:0, green:0, blue:0, alpha:appearance.kDefaultShadowOpacity)
        view.addSubview(baseView)

        baseView.frame = view.frame
        baseView.backgroundColor = UIColor.brownColor()
        
        //Gesture Recognizer for tapping to hide
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(GGLoadingView.tappedOnBaseView(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    func tappedOnBaseView(gestureRecognizer: UITapGestureRecognizer) {

        guard let _ = gestureRecognizer.view else {
            return
        }
        
        self.hide()
    }
    
    public func show() {
        
        selfReference = self
        
        guard let kWindow = UIApplication.sharedApplication().keyWindow else {
            print("Please make sure you have show in view did appear method")
            return
        }
        
        kWindow.addSubview(view)
        view.frame = kWindow.bounds
        baseView.frame = kWindow.bounds
    }
    
    public func hide() {
        view.alpha = 0
        view.removeFromSuperview()
        selfReference = nil
    }
}
