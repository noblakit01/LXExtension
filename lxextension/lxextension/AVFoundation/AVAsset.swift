//
//  AVAsset.swift
//  lxextension
//
//  Created by Tran Minh Luan on 1/15/21.
//  Copyright © 2021 luantran. All rights reserved.
//

import AVFoundation

public extension AVAsset {
    
    var videoSize: CGSize? {
        get {
            guard let track = tracks(withMediaType: AVMediaType.video).first else {
                return nil
            }
            let size = track.naturalSize.applying(track.preferredTransform)
            return CGSize(width: abs(size.width), height: abs(size.height))
        }
    }
    
}
