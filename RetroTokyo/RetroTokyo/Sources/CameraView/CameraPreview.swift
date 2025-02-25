//
//  CameraPreview.swift
//  RetroTokyo
//
//  Created by 조호근 on 2/24/25.
//

import AVFoundation
import SwiftUI

struct CameraPreview: UIViewRepresentable {
    
    class CameraPreviewView: UIView {
        override class var layerClass: AnyClass {
            AVCaptureVideoPreviewLayer.self
        }
        
        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            layer as! AVCaptureVideoPreviewLayer
        }
    }
    
    let session: AVCaptureSession
    
    func makeUIView(context: Context) -> some UIView {
        let view = CameraPreviewView()
        view.videoPreviewLayer.session = session
        view.videoPreviewLayer.videoGravity = .resizeAspectFill
        view.videoPreviewLayer.connection?.videoRotationAngle = 90
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
}
