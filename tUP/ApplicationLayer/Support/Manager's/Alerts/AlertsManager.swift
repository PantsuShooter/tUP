//
//  AlertsManager.swift
//  tUP
//
//  Created by Home on 19.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import SwiftMessages

class AlertsManager {
    
    public class func showStatusBarErrorMessageWith(text: String) {
        
        let view = MessageView.viewFromNib(layout: .statusLine)

        view.configureTheme(.error)
        view.configureDropShadow()
        view.configureContent(title: "Warning", body: text)
        SwiftMessages.show(view: view)
    }
}
