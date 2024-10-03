//
//  FlutterHomeViewController.swift
//  Aiquefome
//
//  Created by André Pimentel on 01/10/24.
//

import UIKit
import Flutter

class FlutterHomeViewController: FlutterViewController {
    let engineTemp: FlutterEngine
    init(engine: FlutterEngine) {
        self.engineTemp = engine
        super.init(engine: engine, nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FlutterHomeViewController - viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FlutterHomeViewController - viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("FlutterHomeViewController - viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("FlutterHomeViewController - viewDidDisappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FlutterHomeViewController - viewDidLoad")
    }
}
