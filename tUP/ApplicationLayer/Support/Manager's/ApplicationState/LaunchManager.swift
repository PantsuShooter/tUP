//
//  LaunchManager.swift
//  tUP
//
//  Created by Home on 19.06.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import UIKit

final class LaunchManager {
    
    private struct Const {
        struct UserDefaultsKeys {
            static let isFirstLaunch = "Is_First_Launch_Key"
            static let authorizationStatus = "Authorization_Status_Key"
        }
    }
    
    enum HasUserGoThroughAuthorizationStage: Int8 {
        case no = 0
        case yes
    }
    
    private static let defaults = UserDefaults.standard
    private static let window: UIWindow? = UIApplication.shared.delegate?.window!
    
    private init() {}

}


//MARK: - FirstLaunch
extension LaunchManager {
    
    static func isFirstLaunch() -> Bool {
        return !defaults.bool(forKey: Const.UserDefaultsKeys.isFirstLaunch)
    }
    
    static func registerFirstLaunch() {
        defaults.set(true, forKey: Const.UserDefaultsKeys.isFirstLaunch)
        defaults.synchronize()
    }
}


//MARK: - AuthorizationStage
extension LaunchManager {
    
    static func hasUserGoThroughAuthorizationStage() -> HasUserGoThroughAuthorizationStage {
                
        guard !isFirstLaunch() else { return .no }
        guard let authorizationStage = defaults.object(forKey: Const.UserDefaultsKeys.authorizationStatus) as? Int8 else {
            return .no
        }
        return HasUserGoThroughAuthorizationStage(rawValue: authorizationStage) ?? .no
    }
    
    static func setUserAuthorizationStage(to state: HasUserGoThroughAuthorizationStage) {
        defaults.set(state.rawValue, forKey: Const.UserDefaultsKeys.authorizationStatus)
    }
}


//MARK: - WindowRoot
extension LaunchManager {
    
    static func updateWindowRoot(with controller: UIViewController) {
        window?.rootViewController = controller
    }
}
