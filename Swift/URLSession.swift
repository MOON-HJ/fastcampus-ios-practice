import UIKit
// URL Session

// 1. URLSessionConfiguration
// 2. URLSession
// 3. URLSessionTask 를 이용해서 서버와 네트워킹

// URLTask
// - dataTask
// - uploadTask
// - downloadTask

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

var urlComponents = URLComponents(string: "http://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "아이유")
urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)
let requestURL = urlComponents.url!

let dataTask = session.dataTask(with: requestURL) {(data, response, error) in
    guard error == nil else {return }
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    let sucessRange = 200..<300
    guard sucessRange.contains(statusCode) else {
        // handle response error
        return
    }
    
    guard let resultData = data  else {return }
    let resultString = String(data:resultData, encoding: .utf8)
    print("--> result : \(resultString)")
}

dataTask.resume()
