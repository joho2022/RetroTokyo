//
//  CameraViewModel.swift
//  RetroTokyo
//
//  Created by 조호근 on 2/25/25.
//

import SwiftUI
import AVFoundation

final class CameraViewModel: NSObject, ObservableObject {
    
    @Published var isFrontCamera = false
    @Published var recentImage: UIImage?
    
    private let camera = Camera()
    private let photoLibrary = PhotoLibrary()
    
    override init() {
        super.init()
        loadRecentImage()
    }
    
    var session: AVCaptureSession {
        camera.session
    }
    
    func switchCamera() {
        let position: AVCaptureDevice.Position = isFrontCamera ? .front : .back
        camera.switchCamera(to: position)
        isFrontCamera.toggle()
    }
    
    func capturePhoto() {
        camera.capturePhoto(delegate: self)
    }
    
    private func loadRecentImage() {
        photoLibrary.fetchRecentImage { [weak self] imageData in
            if let data = imageData,
               let image = UIImage(data: data) {
                self?.recentImage = image
            }
        }
    }
    
}

extension CameraViewModel: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto,
                     error: Error?) {
        if let imageData = photo.fileDataRepresentation(),
           let image = UIImage(data: imageData) {
            
            DispatchQueue.main.async {
                self.recentImage = image
            }
            
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
}
