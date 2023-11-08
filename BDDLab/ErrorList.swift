import Foundation

enum BBDError: Error {
    case emptyUserNameOrPassword
    case unknown(description: String)
    case networkError(errorCode: Int, description: String)
}
