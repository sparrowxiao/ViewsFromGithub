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
        self.startLoad()


}

func startLoad() {
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

    

}
