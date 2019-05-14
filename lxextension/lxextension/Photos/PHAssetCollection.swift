//
//  PHAssetCollection.swift
//  lxextension
//
//  Created by luantran on 5/14/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import Photos

extension PHAssetCollection {
    
    public var photosCount: Int {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "mediaType == %d", PHAssetMediaType.image.rawValue)
        let result = PHAsset.fetchAssets(in: self, options: fetchOptions)
        return result.count
    }
    
}
