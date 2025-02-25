//
//  CameraView.swift
//  RetroTokyo
//
//  Created by 조호근 on 2/25/25.
//

import SwiftUI
import PhotosUI

struct CameraView: View {
    @StateObject private var viewModel = CameraViewModel()
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing: 0) {
                
                CameraPreview(session: viewModel.session)
                
                HStack() {
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        if let image = viewModel.recentImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40.0, height: 40.0)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } else {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 40, height: 40)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        viewModel.capturePhoto()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 50, height: 50)
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                                .frame(width: 60, height: 60)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        viewModel.switchCamera()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 40, height: 40)
                            
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(20)
                .background(Color.yellow)
            }
        }
    }
}



#Preview {
    CameraView()
}
