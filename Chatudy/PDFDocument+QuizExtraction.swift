import PDFKit

extension PDFDocument {
    func extractBlankQuiz() -> [BlankQuiz] {
        var quizzes: [BlankQuiz] = []

        for pageIndex in 0..<pageCount {
            if let page = self.page(at: pageIndex),
               let pageContent = page.string {

                let lines = pageContent.split(separator: "\n", omittingEmptySubsequences: true)
                if lines.count >= 2 {
                    let question = String(lines[0]).trimmingCharacters(in: .whitespacesAndNewlines)
                    let answer = String(lines[1]).trimmingCharacters(in: .whitespacesAndNewlines)
                    let quiz = BlankQuiz(question: question, answer: answer)
                    quizzes.append(quiz)
                }
            }
        }

        return quizzes
    }
}

protocol Quiz {
    associatedtype Question
    associatedtype Answer

    var question: Question { get }
    var answer: Answer { get }
}

struct BlankQuiz: Quiz {
    typealias Question = String
    typealias Answer = String

    var question: Question
    var answer: Answer
}

struct MultiChoicesQuiz: Quiz {
    typealias Question = String
    typealias Answer = Int
    var choices: [String]

    var question: Question
    var answer: Answer
}

let blankQuiz = BlankQuiz(question: "What is the capital of France?", answer: "Paris")
let multiChoicesQuiz = MultiChoicesQuiz(choices: ["Tokyo", "Beijing", "Seoul"], question: "What is the capital of South Korea?", answer: 2)

