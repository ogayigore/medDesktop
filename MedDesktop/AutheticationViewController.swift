//
//  ViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 23.06.2021.
//

import UIKit

class AutheticationViewController: UIViewController {

    //MARK:- Private Properties
    
    private lazy var customView = view as! AuthenticationView
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = AuthenticationView()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    func configureView() {
        customView.fetchCodeButton.addAction(<#T##action: UIAction##UIAction#>, for: .touchUpInside)
    }
}

