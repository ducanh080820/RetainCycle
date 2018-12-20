//
//  ViewController.swift
//  RetainCycle
//
//  Created by Duc Anh on 12/3/18.
//  Copyright © 2018 Duc Anh. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {

    var vcB: ViewControllerB?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        vcB = segue.destination as? ViewControllerB
    }
    func doSomething() {
        
    }
    
}

class ViewControllerB: UIViewController {
    
    weak var vcC: ViewControllerC?
     var vcA: ViewControllerA?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        vcC = segue.destination as? ViewControllerC
        vcC?.vcB = self
    }
    
    @IBAction func back(_ sender: UIButton) {
    vcA?.doSomething()
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("deinit: \(type(of: self))")
    }
    
}

class ViewControllerC: UIViewController {
    
     var vcB: ViewControllerB?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    deinit {
        print("deinit: \(type(of: self))")
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
