//
//  VKLoginViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 23.05.2021.
//

import UIKit
import WebKit
import Alamofire

class VKLoginViewController: UIViewController{

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    private var urlComponents: URLComponents = {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7859693"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "336918"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.130")
    ]
        return urlComponents
    }()
    
    lazy var request = URLRequest(url: urlComponents.url!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        webView.load(request)
//        logoutSegue()
    }
    
    func logoutSegue() {
       Session.instance.token = ""
       Session.instance.userID = "0"
       
       let dataStore = WKWebsiteDataStore.default()
       dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { (records) in
           for record in records {
               if record.displayName.contains("vk") {
                   dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), for: [record], completionHandler: { [weak self] in
                       self?.webView.load(self!.request)
                   })
               }
           }
       }
       webView.load(request)
   }
}

extension VKLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        guard let token = params["access_token"] else { return }
        Session.instance.token = token
        let id = params["user_id"]
        Session.instance.myID = id!
        

//        print(token)
        
        
        decisionHandler(.cancel)
        
        performSegue(withIdentifier: "accessTrue", sender: self)
        
    }
}
