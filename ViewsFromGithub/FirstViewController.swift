//
//  FirstViewController.swift
//  ViewsFromGithub
//
//  Created by Ting Shoemaker on 6/3/19.
//  Copyright © 2019 Tingswork. All rights reserved.
//

import UIKit
import Foundation

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //1st example to use URLSession to get http request for html content
        self.startLoadHTML()
        
        //2st example to use URLSession to get Response from Github REST API
        self.getRESTContent()


}

    func startLoadHTML() {
        let url = URL(string: "https://tingswork.com")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                //self.handleClientError(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    //self.handleServerError(response)
                    return
            }
            if let mimeType = httpResponse.mimeType, mimeType == "text/html",
                let data = data,
                let string = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    //self.webView.loadHTMLString(string, baseURL: url)
                    print(string);
                }
            }
        }
        task.resume()
    }
    
    
    func getRESTContent(){
        //prepare the url to request
        //1. https://api.github.com/users/sparrowxiao
        //2. put your request of the views of your repo
        guard let url = URL(string: "https://api.github.com/repos/sparrowxiao/HTML-Email-Template/traffic/views") else {
            return
        }
        
        let strToken = "input your token :-]."
        
        //compose the request
        var urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: 10.0 * 1000)
        urlRequest.httpMethod = "GET"
        //http header
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        //token info
        urlRequest.addValue("Token \(strToken)", forHTTPHeaderField: "Authorization")
            
        
        //start to request
        let task = URLSession.shared.dataTask(with: urlRequest)
        { (data, response, error) -> Void in
            guard error == nil else {
                print("Error while fetching github: \(error)")
                return
            }
            //get the return data(JSON Format)
            guard let data = data,
                let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Nil data received from fetchAllRooms service")
                    return
            }
            
            
        }
        
        //done
        task.resume()
        
    }

    

}
