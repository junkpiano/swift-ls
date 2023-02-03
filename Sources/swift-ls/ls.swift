import Foundation
import ArgumentParser

struct LS: ParsableCommand {
    
    @Flag(name: .shortAndLong, help: "toggle verbose log")
    var verbose = false
    
    @Argument(help: "path on the file system")
    var path: String = "."
    
    func run() throws {
        let fileManager = FileManager.default

        do {
            let filepath = path.count > 0 ? path: "."
            let contents = try fileManager.contentsOfDirectory(atPath: filepath)
            contents.forEach { print($0) }
        } catch {
            let err = LSError(with: error as NSError)

            if verbose {
                print(error as NSError)
            }
            
            switch err {
            case .notDirectory:
                print(path)
            case .fileNotFound:
                print("\(path) not found")
            case .letMeInvestigate:
                print("Please raise a ticket on Github!")
            default:
                print("Operation couldn't be completed.")
            }
        }
    }
}

