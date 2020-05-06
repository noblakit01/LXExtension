//
//  AVCaptureConnection.swift
//  lxextension
//
//  Created by Luan Tran on 5/5/20.
//  Copyright © 2020 luantran. All rights reserved.
//

import AVFoundation

public extension AVCaptureConnection {
    
    func setOrientation(_ orientation: AVCaptureVideoOrientation) {
        guard isVideoOrientationSupported else {
            return
        }
        videoOrientation = orientation
    }
    
}
