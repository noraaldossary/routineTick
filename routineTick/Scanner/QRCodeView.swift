//
//  QRCodeView.swift
//  QRCodeScanner
//
//  Created by Nora Aldossary on 18/07/1445 AH.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    @State private var textInput: String = ""

    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            Text("Your QR code, kindly share it with your maid.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
//            TextField("Enter text", text: $textInput)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())

            if let image = generateQRCode(from: textInput) {
                
                
                Image(uiImage: image)
                    .resizable()
                    .interpolation(.none) // Disable interpolation
                    .renderingMode(.original) // Prevent color adjustments
                    .scaledToFit()
                    .frame(width: 250, height: 250) // Adjust the frame size
                
                Spacer()
            } else {
                Text("Invalid input for QR code generation.")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
    

   
    
    
    private func generateQRCode(from text: String) -> UIImage? {
        let data = Data(text.utf8)

        let filter = CIFilter.qrCodeGenerator()
        filter.setValue(data, forKey: "inputMessage")

        guard let ciImage = filter.outputImage else { return nil }

        let context = CIContext()
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil }

        return UIImage(cgImage: cgImage)
    }
}

// Preview section
struct qrView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
    }
}

