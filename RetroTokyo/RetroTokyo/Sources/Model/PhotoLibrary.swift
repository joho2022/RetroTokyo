//
//  PhotoLibrary.swift
//  RetroTokyo
//
//  Created by 조호근 on 2/26/25.
//

import Photos

struct PhotoLibrary {
    
    func fetchRecentImage(mediaType: PHAssetMediaType = .image,
                          completion: @escaping (Data?) -> Void) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        fetchOptions.fetchLimit = 1
        
        let fetchResult = PHAsset.fetchAssets(with: mediaType, options: fetchOptions)
        
        if let asset = fetchResult.firstObject {
            let options = PHImageRequestOptions()
            options.deliveryMode = .fastFormat
            
            PHImageManager.default().requestImageDataAndOrientation(
                for: asset,
                options: options
            ) { imageData, _, _, _ in
                DispatchQueue.main.async {
                    completion(imageData)
                }
            }
        }
    }
    
}
