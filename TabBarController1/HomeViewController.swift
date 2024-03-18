//
//  HomeViewController.swift
//  TabBarController1
//
//  Created by Md Akash on 11/3/24.
//

import UIKit
import WebKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "https://www.google.com/")
        let request = NSURLRequest(url : url! as URL)
        
        webView.load(request as URLRequest)
        searchBar.text = "https://"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func suchBarSearchButtonClicked(searchbar:UISearchBar){
        searchbar.resignFirstResponder()
        
        let text = searchbar.text
        let url = NSURL(string: text!)
        let reqest = NSURLRequest(url: url! as URL)
        
        webView.load(reqest as URLRequest)
        
        
    }


}
