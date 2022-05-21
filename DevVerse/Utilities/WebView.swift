//
//  WebView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import SwiftUI
import WebKit

struct WebView: View {
    
    var url: URL
    
    var body: some View {
        WebViewRepresentable(url: url)
            .navigationTitle(url.description)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct WebViewRepresentable: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WebView(url: URL(string: "https://www.apple.com")!)
        }
    }
}
