//
//  NetworkServiceLayer.swift
//  AssessmentApp
//
//  Created by Irfan Saeed on 19/01/2022.
//

import Foundation

// You may use this URL to load data similar to that which is present in DemoData.swift
let demoDataURL = URL(string: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba")!

#warning("Build an actual working service that can fetch the model entities. You may start out with the mock data provided here.")
// Until you have built out your network service, you can use the mock
// response provided here:
class NetworkServiceLayer {
        class func request<T: Codable>(router: Router, completion: @escaping (Result<[String: T], Error>) -> ()) {
            let api = router.scheme + router.host
            let endpoint = api + router.path
            guard let url = URL(string: endpoint) else { return }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = router.method
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let err = error {
                    completion(.failure(err))
                    print(err.localizedDescription)
                    return
                }
                guard response != nil, let data = data else {
                    return
                }
                
                do {

                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {

//                        if let pr = json["TDOC"] as? Dictionary<String, Any> {
//                            print(pr["assetType"])
//                        }
                    }

                } catch let err {

                    print(err.localizedDescription)
                }
                let responseObject = try! JSONDecoder().decode([String: T].self, from: data)
                //let responseObject = try! JSONDecoder().decode([String: [T]].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            }
            dataTask.resume()
        }
    }
