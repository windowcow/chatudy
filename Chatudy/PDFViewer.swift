import Foundation
import PDFKit
import MobileCoreServices
import SwiftUI
import UniformTypeIdentifiers

struct PDFViewer: UIViewRepresentable {
    let url: URL
    @State private var pdfText: String = ""

    func makeUIView(context: Context) -> PDFView {
        loadPDFText() // Load the PDF text
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
        
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // Update the view if needed
    }
    
    func loadPDFText() {
        if let pdfDocument = PDFDocument(url: url) {
            pdfText = extractText(from: pdfDocument)
            print(pdfText)
        }
    }
    
    func extractText(from pdfDocument: PDFDocument) -> String {
        var extractedText = ""
        
        for pageIndex in 0..<pdfDocument.pageCount {
            if let page = pdfDocument.page(at: pageIndex) {
                if let pageText = page.string {
                    extractedText += pageText
                }
            }
        }
        print(extractedText)
        return extractedText
    }

    

}

struct DocumentPicker: UIViewControllerRepresentable {
    @Binding var pdfURL: URL?
    @Environment(\.presentationMode) private var presentationMode

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf], asCopy: true)
        documentPicker.delegate = context.coordinator
        return documentPicker
    }


    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {
        // Update the view if needed
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPicker

        init(_ parent: DocumentPicker) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            parent.pdfURL = urls.first
            parent.presentationMode.wrappedValue.dismiss()
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
