//
//  ArticleModel.swift
//  19. ვებ სერვისებთან კომუნიკაცია
//
//  Created by koba Sinauridze on 30.10.24.
//

import Foundation

public struct Source: Decodable {
    public let id: String?
    public let name: String
}

public struct Article: Decodable {
    public let source: Source
    public let author: String?
    public let title: String
    public let description: String?
    public let url: String
    public let urlToImage: String?
    public let publishedAt: String
    public let content: String?
}

public struct NewsResponseData: Decodable {
    public let status: String
    public let totalResults: Int
    public let articles: [Article]
}

