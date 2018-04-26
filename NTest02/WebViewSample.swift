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
  
  fileprivate var buttonUpload: UIButton!
  fileprivate var activityIndicatorView: UIActivityIndicatorView!
  
  fileprivate var progressView: UIProgressView!
  fileprivate var timer: Timer!
  
  fileprivate var numLabel: UILabel!
  fileprivate var toolBar: UIToolbar!
  fileprivate var secondLabel: UILabel!
  
  fileprivate var navigationBar: UINavigationBar!
  // MAKR: Initialization
  fileprivate func initWebView() {
    webView = WKWebView(frame: .zero)
    self.view.addSubview(webView)
    
    webView.backgroundColor = .white
    
  }
  
  fileprivate func initNumLabel() {
    numLabel = UILabel(frame: .zero)
    self.view.addSubview(numLabel)
    
    numLabel.text = "0.00"
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
    self.view.addSubview(buttonLoadRequest)
    
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
  
  fileprivate func initButtonUpload() {
    buttonUpload = UIButton(type: .system)
    buttonUpload.frame = .zero
    self.view.addSubview(buttonUpload)
    
    buttonUpload.backgroundColor = .white
    buttonUpload.layer.cornerRadius = 10
    buttonUpload.setTitle("upload", for: .normal)
    buttonUpload.addTarget(self, action: #selector(startTomove), for: .touchUpInside)
    buttonUpload.addTarget(self, action: #selector(downloadProgress), for: .touchUpInside)
  }
  
  fileprivate func initActivityIndicatorView() {
    activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    activityIndicatorView.frame = .zero
    self.view.addSubview(activityIndicatorView)
    
    activityIndicatorView.hidesWhenStopped = true
    
  }
  
  
  fileprivate func initProgressView() {
    progressView = UIProgressView(progressViewStyle: .bar)
    progressView.frame = .zero
    progressView.layer.cornerRadius = 10
    
    
    self.view.addSubview(progressView)
  }
  
  
  fileprivate func initToolBar() {
    toolBar = UIToolbar(frame: .zero)
    self.view.addSubview(toolBar)
    
    let saveButton = UIBarButtonItem( barButtonSystemItem: .save, target: self, action: #selector(save))
    let stopButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.stop, target: self, action: #selector(stop))
    let flexiButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    let aaaButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(stop))
    let cbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.action, target: self, action: #selector(stop))
    let bbbButton = UIBarButtonItem(title: "aaa", style: .plain, target: self, action: nil)
    let ebutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.bookmarks, target: self, action: #selector(stop))
    let fbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.camera, target: self, action: #selector(stop))
    let gbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.compose, target: self, action: #selector(stop))
    let hbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(stop))
    let ibutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(stop))
    toolBar.items = [saveButton,flexiButton,stopButton,flexiButton,aaaButton,flexiButton,bbbButton,flexiButton,cbutton,flexiButton,ebutton,flexiButton,fbutton,flexiButton,gbutton,flexiButton,hbutton,flexiButton,ibutton]
    
    
  }
  
  
  fileprivate func initSecondLabel() {
    secondLabel = UILabel(frame: .zero)
    self.view.addSubview(secondLabel)
    
    secondLabel.text = "Label"
  }
  
  fileprivate func initNavigationBar() {
    navigationBar = UINavigationBar(frame: .zero)
    self.view.addSubview(navigationBar)
    
    let saveButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(save))
    let stopButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(stop))
    
    let navigationItem = UINavigationItem()
    navigationItem.title = "bar"
    navigationItem.leftBarButtonItem = saveButton
    navigationItem.rightBarButtonItem = stopButton
    navigationBar.items = [navigationItem]
  }
  
  // MAKR: Life circle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initWebView()
    initNumLabel()
    initButtonBar()
    //    initButtonLoadHTMLString()
    //    initButtonLoadData()
    initButtonLoadRequest()
    initButtonActionSheet()
    initButtonAlerView()
    initButtonUpload()
    initActivityIndicatorView()
    initProgressView()
    //initTimer()
    initSecondLabel()
    initToolBar()
    initNavigationBar()
  }
  
  override func viewWillLayoutSubviews() {
    makeConstraints()
    
  }
  
  
  // MAKR: Constraints
  fileprivate func makeConstraints() {
    // let screen = UIScreen.main.bounds
    
    self.view.snp.makeConstraints { (make) in
      make.top.left.right.equalTo(UIScreen.main.bounds.size)
      make.bottom.equalTo(UIScreen.main.bounds.size)
    }
    
    navigationBar.snp.makeConstraints { (make) in
      make.top.left.right.equalToSuperview()
      make.height.equalTo(40)
    }
    
    webView.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(400)
      make.left.equalToSuperview()
      make.height.width.equalTo(200)
    }
    
    numLabel.snp.makeConstraints { (make) in
      make.bottom.equalTo(webView.snp.top).offset(-16)
      make.left.equalToSuperview().offset(8)
      make.height.equalTo(30)
      make.width.equalTo(200)
    }
    
    //    buttonBar.snp.makeConstraints { (make) in
    //      make.top.equalToSuperview().offset(15)
    //      make.left.right.equalToSuperview()
    //      make.width.equalTo(30)
    //    }
    
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
      make.top.equalToSuperview().offset(60)
      make.right.equalToSuperview()
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
    
    activityIndicatorView.snp.makeConstraints{ (make) in
      make.top.equalToSuperview().offset(64)
      make.left.equalToSuperview().offset(16)
      make.width.equalTo(60)
      make.height.equalTo(60)
    }
    buttonUpload.snp.makeConstraints { (make) in
      make.top.equalTo(activityIndicatorView.snp.bottom).offset(16)
      make.left.equalTo(activityIndicatorView).offset(15)
      make.width.equalTo(60)
      make.height.equalTo(30)
      
    }
    
    
    
    progressView.snp.makeConstraints { (make) in
      make.top.equalTo(buttonUpload.snp.bottom).offset(32)
      make.left.equalToSuperview().offset(16)
      make.height.equalTo(16)
      make.width.equalTo(200)
    }
    
    secondLabel.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
      make.height.equalTo(secondLabel.intrinsicContentSize)
      make.width.equalTo(100)
    }
    
    toolBar.snp.makeConstraints { (make) in
      make.bottom.right.left.equalToSuperview()
      make.height.equalTo(40)
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
    
//    alerController.addAction(noAction)
//    alerController.addAction(yesAction)
//    alerController.addAction(skipAction)
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
//
//    actionSheetController.addAction(aSheet)
//    actionSheetController.addAction(bSheet)
//    actionSheetController.addAction(cSheet)
//
    self.present(actionSheetController, animated: true, completion: nil)
  }
  
  @objc func startTomove() {
    if (activityIndicatorView.isAnimating){
      activityIndicatorView.stopAnimating()
    }else{
      activityIndicatorView.startAnimating()
    }
  }
  
  @objc func downloadProgress() {
    activityIndicatorView.hidesWhenStopped = false
    timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(download), userInfo: nil, repeats: true)
  }
  
  @objc func download() {
    progressView.progress = progressView.progress + 0.01
    numLabel.text = String((Double(Int(progressView.progress * 100))/100))
    if (progressView.progress == 1.0) {
      timer.invalidate()
      let alerController: UIAlertController = UIAlertController(title: "download completed", message: "Great!", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alerController.addAction(okAction)
      
      
      activityIndicatorView.stopAnimating()
      self.present(alerController, animated: true, completion: nil)
    }
  }
  
  @objc func save() {
    secondLabel.text = "click save"
  }
  
  @objc func stop() {
    secondLabel.text = "stopped"
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
