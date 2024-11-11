// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

public protocol dependencyToHomeScene {
    func getData()
    func count() -> Int
    func article(at index: Int) -> Article
}

public protocol dependencyToDetailsScene {
    func getData(articleAt: Int)
} 

public final class NetworkManager {
    
    public init() {}
    
    public func fetchNews(with url: String, completion: @escaping @Sendable (NewsResponseData) -> Void) {
        guard let queryURL = URL(string: url) else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: queryURL) { data, response, error in
            if let data = data {
                do {
                    let newsList = try JSONDecoder().decode(NewsResponseData.self, from: data)
                    completion(newsList)
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                }
            } else {
                if let error = error {
                    print("Network error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
