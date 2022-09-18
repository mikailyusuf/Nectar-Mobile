//
//  CheckoutViewController.swift
//  Nectar
//
//  Created by Mikail on 10/09/2022.
//

import WebKit
import ToastViewSwift

class CheckoutViewController: UIViewController, WKNavigationDelegate {
    let callbackUrl = "https://fast-chamber-15946.herokuapp.com/api/paystack/redirect"
    var pstkUrl:String = ""
    let sUrl = "https://standard.paystack.co/close"
    
      var webView: WKWebView!
    
    override func loadView() {
    
        guard let url = URL(string: pstkUrl) else {return}
        let urlRequest = URLRequest(url: url)
        webView = WKWebView()
        webView.allowsBackForwardNavigationGestures = true
        webView.load(urlRequest)
        self.webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        if let url = navigationResponse.response.url {
            
            /*
             We control here when the user wants to cancel a payment.
             By default a cancel action redirects to http://cancelurl.com/.
             Based on our workflow we can for example remove the webview or push
             another view to the user.
             */
            if url.absoluteString == "http://cancelurl.com/"{
                decisionHandler(.cancel)
            }
            else{
                decisionHandler(.allow)
            }
            
            //After a successful transaction we can check if the current url is the callback url
            //and do what makes sense for our workflow. We can get the transaction reference for example.
            
            if url.absoluteString.hasPrefix(callbackUrl){
//                let reference = getQueryStringParameter(url: url.absoluteString, param: "reference")
                let toast = Toast.text("Order was successful.")
                toast.show()
                print("Payment success")
                navigationController?.viewControllers.removeAll(where: { (vc) -> Bool in
                    if vc.isKind(of: ShopViewController.self) {
                        return false
                    } else {
                        return true
                    }
                })
            }
        }
    }
}
