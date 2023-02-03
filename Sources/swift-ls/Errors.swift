import Foundation

enum LSError: Error {
    case notDirectory
    case fileNotFound
    case letMeInvestigate
    case unexpected
}

extension LSError {
    init(with error: NSError) {
        if let underlyingError = error.userInfo["NSUnderlyingError"] as? NSError {
            switch underlyingError.code {
            case 20:
                self = .notDirectory
            case -43:
                self = .fileNotFound
            default:
                self = .letMeInvestigate
            }
        } else {
            self = .unexpected
        }
    }
}
