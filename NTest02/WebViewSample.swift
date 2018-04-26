//
//  WebViewSample.swift
//  NTest02
//
//  Created by YUTONG WU on 2018/04/26.
//  Copyright © 2018 Big. All rights reserved.
//

import  Foundation
import UIKit
import WebKit
import SnapKit


class WebViewController: UIViewController, WKNavigationDelegate {
  
  // MARK: properties
  fileprivate var webView: WKWebView!
  fileprivate var buttonBar: UIView!
  fileprivate var buttonLoadHTMLString: UIButton!
  fileprivate var buttonLoadData: UIButton!
  fileprivate var buttonLoadRequest: UIButton!
  
  fileprivate var buttonAlerView: UIButton!
  fileprivate var buttonActionSheet: UIButton!
  
  // MAKR: Initialization
  fileprivate func initWebView() {
    webView = WKWebView(frame: .zero)
    self.view.addSubview(webView)
    
    webView.backgroundColor = .white
    
  }
  
  fileprivate func initButtonBar() {
    buttonBar = UIView(frame: .zero)
    self.view.addSubview(buttonBar)
    
  }
  
  fileprivate func initButtonLoadHTMLString() {
    buttonLoadHTMLString = UIButton(type: .system)
    buttonLoadHTMLString.frame = .zero
    buttonBar.addSubview(buttonLoadHTMLString)
    
    
    buttonLoadHTMLString.backgroundColor = .white
    buttonLoadHTMLString.layer.cornerRadius = 30
    buttonLoadHTMLString.setTitle("HTML_Str", for: .normal)
    
    buttonLoadHTMLString.addTarget(self, action: #selector(testLoadHTMLString), for: .touchUpInside)
  }
  
  fileprivate func initButtonLoadData() {
    buttonLoadData = UIButton(type: .system)
    buttonLoadData.frame = .zero
    buttonBar.addSubview(buttonLoadData)
    
    buttonLoadData.backgroundColor = .white
    buttonLoadData.layer.cornerRadius = 30
    buttonLoadData.setTitle("LoadData", for: .normal)
    
    buttonLoadData.addTarget(self, action: #selector(testLoadData), for: .touchUpInside)
  }
  
  fileprivate func initButtonLoadRequest() {
    buttonLoadRequest = UIButton(type: .system)
    buttonLoadRequest.frame = .zero
    buttonBar.addSubview(buttonLoadRequest)
    
    buttonLoadRequest.backgroundColor = .white
    buttonLoadRequest.layer.cornerRadius = 30
    buttonLoadRequest.setTitle("LoadRequest", for: .normal)
    
    buttonLoadRequest.addTarget(self, action: #selector(testLoadRequest), for: .touchUpInside)
  }
  
  fileprivate func initButtonAlerView() {
    buttonAlerView = UIButton(type: .system)
    buttonAlerView.frame = .zero
    self.view.addSubview(buttonAlerView)
    
    buttonAlerView.backgroundColor = .white
    buttonAlerView.layer.cornerRadius = 10
    buttonAlerView.setTitle("aler", for: .normal)
    
    buttonAlerView.addTarget(self, action: #selector(textAlert), for: .touchUpInside)
    
  }
  
  fileprivate func initButtonActionSheet() {
    buttonActionSheet = UIButton(type: .system)
    buttonActionSheet.frame = .zero
    self.view.addSubview(buttonActionSheet)
    
    buttonActionSheet.backgroundColor = .white
    buttonActionSheet.layer.cornerRadius = 10
    buttonActionSheet.setTitle("sheet", for: .normal)
    buttonActionSheet.addTarget(self, action: #selector(testSheet), for: .touchUpInside)
  }
  
  // MAKR: Life circle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initWebView()
    initButtonBar()
    //    initButtonLoadHTMLString()
    //    initButtonLoadData()
    initButtonLoadRequest()
    initButtonActionSheet()
    initButtonAlerView()
    
  }
  
  override func viewWillLayoutSubviews() {
    makeConstraints()
    
  }
  
  
  // MAKR: Constraints
  fileprivate func makeConstraints() {
    // let screen = UIScreen.main.bounds
    
    self.view.snp.makeConstraints { (make) in
      make.top.left.right.bottom.equalTo(UIScreen.main.bounds.size)
    }
    
    webView.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(400)
      make.left.equalToSuperview()
      make.height.width.equalTo(UIScreen.main.bounds.size)
    }
    
    buttonBar.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(15)
      make.left.right.equalToSuperview()
      make.width.equalTo(30)
    }
    
    //    buttonLoadHTMLString.snp.makeConstraints { (make) in
    //      make.top.left.bottom.equalTo(buttonBar)
    //      make.width.equalTo(120)
    //    }
    
    //    buttonLoadData.snp.makeConstraints { (make) in
    //      make.top.bottom.equalToSuperview()
    //      make.left.equalTo(100).offset(16)
    //      make.width.equalTo(120)
    //    }
    
    buttonLoadRequest.snp.makeConstraints { (make) in
      make.top.bottom.equalToSuperview()
      make.left.equalTo(200)
      make.width.equalTo(120)
    }
    
    buttonActionSheet.snp.makeConstraints { (make) in
      make.top.left.equalToSuperview().offset(48)
      make.height.equalTo(30)
      make.width.equalTo(60)
    }
    
    buttonAlerView.snp.makeConstraints { (make) in
      make.top.equalTo(buttonActionSheet)
      make.left.equalTo(buttonActionSheet.snp.right).offset(50)
      make.width.equalTo(60)
      make.height.equalTo(30)
    }
    
  }
  // MARK: Tap event
  @objc func testLoadHTMLString() {
    let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
    let bundleURL = NSURL.fileURL(withPath: Bundle.main.bundlePath)
    
    do {
      print("***************************************")
      let html = try NSString(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8.rawValue)
      self.webView.loadHTMLString(html as String, baseURL: bundleURL)
    } catch let err as NSError {
      print( err.description)
    }
  }
  
  @objc func testLoadData() {
    let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
    let bundleURL = NSURL.fileURL(withPath: Bundle.main.bundlePath)
    let htmlData = NSData(contentsOfFile: htmlPath!)
    
    self.webView.load(htmlData! as Data, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: bundleURL)
  }
  
  @objc func testLoadRequest() {
    let url = URL(string: "https://www.google.jp")
    let request = URLRequest(url: url! )
    self.webView.load(request )
    self.webView.navigationDelegate = self
  }
  
  // MARK: Methods
  
  @objc func textAlert() {
    let alerController: UIAlertController = UIAlertController(title: "Main aler", message: "Sub aler", preferredStyle: UIAlertControllerStyle.alert)
    
    let noAction = UIAlertAction(title: "No", style: .default) { (alerAction) in
      print("Tap no button")
    }
    let yesAction = UIAlertAction(title: "Yes", style: .cancel) { (alerAction) in
      print("Tap yes button")
    }
    
    let skipAction = UIAlertAction(title: "skip", style: .default) { (alerAction) in
      print("Tap yes button")
    }
    
    alerController.addAction(noAction)
    alerController.addAction(yesAction)
    alerController.addAction(skipAction)
    self.present(alerController, animated: true, completion: nil)
  }
  
  
  @objc func testSheet() {
    let actionSheetController: UIAlertController = UIAlertController(title: "Main sheet", message: "sub sheet", preferredStyle: .actionSheet)
    let aSheet = UIAlertAction(title: "A", style: .default) { (sheetAction) in
      print("tap a")
    }
    let bSheet = UIAlertAction(title: "B", style: .cancel) { (sheetAction) in
      print("tap b")
    }
    let cSheet = UIAlertAction(title: "C", style: .destructive) { (sheetAction) in
      print("tap c")
    }
    
    actionSheetController.addAction(aSheet)
    actionSheetController.addAction(bSheet)
    actionSheetController.addAction(cSheet)
    
    self.present(actionSheetController, animated: true, completion: nil)
  }
  
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    print("start")
  }
  
  func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    print("begin to return")
    
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("finish")
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    print("error")
  }
}
