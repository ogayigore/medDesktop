//
//  MainViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 05.07.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK:- Private Properties
    
    private lazy var customView = view as! MainView
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = MainView()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Пациенты"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
