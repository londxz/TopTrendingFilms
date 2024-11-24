//
//  APICaller.swift
//  TopTrendingMovies
//
//  Created by Родион Холодов on 04.11.2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case parsingError
    case networkError
    case dataError
}

class APICaller {
    
    static func getTrendingMovies(
        completionHandler: @escaping(_ result: Result<TrendingMoviesModel, NetworkError>) -> Void) {
        
            let urlString = NetworkingConstant.shared.serverAdress +
            "movie/popular"
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(.urlError))
                return
            }
            
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1"),
            ]
            
            components.queryItems = (components.queryItems ?? []) + queryItems
            
            guard let finalURL = components.url else {
                completionHandler(.failure(.urlError))
                return
            }

            
            var request = URLRequest(url: finalURL)
            request.httpMethod = "GET"
            request.timeoutInterval = 10
            request.allHTTPHeaderFields = [
                "accept": "application/json",
                "Authorization": "Bearer \(NetworkingConstant.shared.apiBearerToken)"
            ]
            
            
            URLSession.shared.dataTask(with: request) { dataResponse, URLResponse, error in
                if let error = error {
                    print("Network error: \(error.localizedDescription)")
                    completionHandler(.failure(.networkError))
                    return
                }

                
                
                guard let data = dataResponse else {
                    completionHandler(.failure(.dataError))
                    return
                }
                
                do {
                    let resultData = try JSONDecoder().decode(TrendingMoviesModel.self, from: data)
                    completionHandler(.success(resultData))
                    
                } catch {
                    completionHandler(.failure(.parsingError))
                }
            }.resume()
            
            
    }
}
