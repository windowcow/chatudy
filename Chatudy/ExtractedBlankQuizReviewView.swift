import SwiftUI

struct ExtractedBlankQuizReviewView: View {
    @State var answer: String = ""
    let correctAnswer = "17" // 정답 예시

    var body: some View {
        VStack {
            VStack {
                Text("우리 나라는 ____개의 도시로 이루어져 있다.")
                    .padding(8)
                Divider()
                Text("8")
                    .padding(8)
            }
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            HStack {
                Spacer()
                Button("다시 생성") {
                    
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                Spacer()
                
                Button("저장") {

                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                Spacer()

            }
        }
    }
}

struct BlankQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedBlankQuizReviewView()
    }
}
