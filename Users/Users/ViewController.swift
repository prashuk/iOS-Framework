//
//  ViewController.swift
//  Users
//
//  Created by Prashuk Ajmera on 2/1/25.
//

import UIKit
import SampleFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func fetch() {
        Task {
            let res = await Sample.fetchActivity()
            switch res {
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error)
            }
        }
    }

}

