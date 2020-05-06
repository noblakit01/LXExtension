//
//  AVCaptureVideoOrientation.swift
//  lxextension
//
//  Created by Luan Tran on 5/5/20.
//  Copyright © 2020 luantran. All rights reserved.
//

import AVFoundation
import UIKit

public extension AVCaptureVideoOrientation {
    
    static var current: AVCaptureVideoOrientation {
        get {
            switch UIDevice.current.orientation {
            case .portrait:
                return .portrait
            case .landscapeLeft:
                return .landscapeRight
            case .landscapeRight:
                return .landscapeLeft
            default:
                return .portrait
            }
        }
    }
    
}
