import UIKit

// URL
let urlString =  "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)

url?.absoluteString
url?.scheme

url?.host
url?.path
url?.query
url?.baseURL

let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)

baseURL?.host
baseURL?.path
baseURL?.query
baseURL?.baseURL

//URL Components
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
let mediaQuery = URLQueryItem(name: "media", value:"music")
let entityQuery = URLQueryItem(name: "entity", value:"song")
let termQuery = URLQueryItem(name: "term", value:"지드래곤")


urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)

urlComponents?.url
urlComponents?.path
urlComponents?.host
urlComponents?.query
urlComponents?.queryItems?.last

