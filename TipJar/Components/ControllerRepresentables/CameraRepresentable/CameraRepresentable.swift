//
//  CameraRepresentable.swift
//  TipJar
//
//  Created by kukuh on 10/04/22.
//

import SwiftUI

struct CameraRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    @ObservedObject var viewModel = CameraRepresentableViewModel()

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.delegate = context.coordinator
        viewController.sourceType = .camera
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> CameraRepresentable.Coordinator {
        return Coordinator(self, viewModel: viewModel)
    }
}

extension CameraRepresentable {
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraRepresentable
        let viewModel: CameraRepresentableViewModel
        
        init(_ parent: CameraRepresentable, viewModel: CameraRepresentableViewModel) {
            self.parent = parent
            self.viewModel = viewModel
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            viewModel.onCancelHandler()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                let base64Image = image.base64
                viewModel.onReceiveBase64Imagehandler(base64Image)
            }
        }
    }
}
