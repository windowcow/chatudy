import Foundation
// ChatTab이 열리면 ConversationModel이 실행되어야 한다.
// ConversationModel은 conversations들을 불러오는데 이 과정은 request를 통해 이루어진다.
struct ConversationModel {
    let conversation: [String]
}
