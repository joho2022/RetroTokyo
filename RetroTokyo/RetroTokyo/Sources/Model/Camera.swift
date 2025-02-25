//
//  Camera.swift
//  RetroTokyo
//
//  Created by 조호근 on 2/25/25.
//

import AVFoundation

final class Camera {
    
    let session = AVCaptureSession()
    private let photoOutput = AVCapturePhotoOutput()
    
    init() {
        setupCamera()
    }
    
    private func setupCamera() {
        session.beginConfiguration()
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if session.canAddInput(input) { session.addInput(input) }
            if session.canAddOutput(photoOutput) { session.addOutput(photoOutput) }
        } catch {
            print("카메라 설정 실패: \(error.localizedDescription)")
        }
        
        session.commitConfiguration()
        
        DispatchQueue.global().async { [weak self] in
            self?.session.startRunning()
        }
    }
    
    func switchCamera(to position: AVCaptureDevice.Position) {
        session.beginConfiguration()
        session.inputs.forEach { session.removeInput($0) }
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: position) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if session.canAddInput(input) {
                session.addInput(input)
            }
        } catch {
            print("카메라 전환 실패: \(error.localizedDescription)")
        }
        
        session.commitConfiguration()
    }
    
    func capturePhoto(delegate: AVCapturePhotoCaptureDelegate) {
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: delegate)
    }
    
}
