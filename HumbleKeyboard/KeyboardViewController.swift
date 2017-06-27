//
//  KeyboardViewController.swift
//  HumbleKeyboard
//
//  Created by Yamazaki Mitsuyoshi on 2017/06/27.
//  Copyright © 2017 Mitsuyoshi Yamazaki. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
  
  @IBOutlet var nextKeyboardButton: UIButton!
  let keyboardView: UIView = {
    
    let nib = UINib(nibName: "Keyboard", bundle: nil)
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    view.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
    
    return view
  }()
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print(view)
    view.addSubview(keyboardView)
    
    // Perform custom UI setup here
    self.nextKeyboardButton = UIButton(type: .system)
    
    self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
    self.nextKeyboardButton.sizeToFit()
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
    
    self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    
    self.view.addSubview(self.nextKeyboardButton)
    
    self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
  }
  
  override func textWillChange(_ textInput: UITextInput?) {
    // The app is about to change the document's contents. Perform any preparation here.
  }
  
  override func textDidChange(_ textInput: UITextInput?) {
    // The app has just changed the document's contents, the document context has been updated.
    
    var textColor: UIColor
    let proxy = self.textDocumentProxy
    if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
      textColor = UIColor.white
    } else {
      textColor = UIColor.black
    }
    self.nextKeyboardButton.setTitleColor(textColor, for: [])
  }
  
}
