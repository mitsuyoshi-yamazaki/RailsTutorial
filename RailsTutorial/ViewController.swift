//
//  ViewController.swift
//  RailsTutorial
//
//  Created by Yamazaki Mitsuyoshi on 2017/06/26.
//  Copyright © 2017 Mitsuyoshi Yamazaki. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
  
  private let webView: WKWebView = {
    
    let webView = WKWebView.init(frame: .zero, configuration: .init())
    webView.allowsBackForwardNavigationGestures = false
    
    webView.load(.init(url: Constant.cloud9URL))
    
    return webView
  }()
  
  override func loadView() {
    super.loadView()
    
    webView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
    webView.frame = view.bounds
    view.addSubview(webView)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

