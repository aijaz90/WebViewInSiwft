//
//  ViewController.swift
//  Yarn Today
//
//  Created by Aijaz Ali on 3/17/21.
//

import WebKit
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareView()
    }

    private func prepareView() {
        self.title = .appTitle
        self.loadWebsite()
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        webView.goBack()
    }

    @IBAction func forwardButtonTapped(_ sender: UIButton) {
        webView.goForward()
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == .estimatedProgress {
            self.progressBar.progress = Float(webView.estimatedProgress)
        }
    }

    private func loadWebsite() {
        self.webView.navigationDelegate = self
        guard let url = URL(string: Constants.Links.yarnLink) else { return }
        self.webView.load(URLRequest(url: url))
    }
}

extension HomeViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.progressBar.isHidden = false
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.progressBar.isHidden = true
        self.backButton.isHidden = webView.canGoBack ? false : true
        self.forwardButton.isHidden = webView.canGoForward ? false : true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.progressBar.isHidden = true
        self.backButton.isHidden = webView.canGoBack ? false : true
        self.forwardButton.isHidden = webView.canGoForward ? false : true
    }
}
