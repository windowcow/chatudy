import SwiftUI

struct ResourceTabView: View {
    @State private var showDocumentPicker = false
    @State private var pdfURL: URL?

    var body: some View {
        NavigationView {
            VStack {
                if let url = pdfURL {
                    PDFViewer(url: url)
                    
                    Button(action: {
                        // 퀴즈 추출 작업을 수행합니다.
                    }, label: {
                        Text("퀴즈 추출하기")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                    .padding()
                } else {
                    Text("PDF 파일을 선택하십시오.")
                    
                    Button(action: {
                        showDocumentPicker.toggle()
                    }, label: {
                        Text("PDF 파일 선택")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                    .padding()
                    .sheet(isPresented: $showDocumentPicker) {
                        DocumentPicker(pdfURL: $pdfURL)
                    }
                }
            }
            .navigationBarTitle("PDF Viewer", displayMode: .inline)
        }
    }
}

struct ReviewTabView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceTabView()
    }
}
