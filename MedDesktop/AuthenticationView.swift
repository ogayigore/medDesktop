//
//  AuthenticationView.swift
//  MedDesktop
//
//  Created by Igor Ogai on 29.06.2021.
//

import UIKit
import FlagPhoneNumber

class AuthenticationView: UIView {
    
    var listController: FPNCountryListViewController!
    var phoneNumber: String?
    
    //MARK:- Private Properties
    
    private lazy var numberTextField: FPNTextField = {
        let textField = FPNTextField()
        textField.setFlag(key: .RU)
        textField.flagButtonSize = CGSize(width: 60, height: 60)
        textField.hasPhoneNumberExample = false
        textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.placeholder = " Введите номер"
        textField.textColor = .white
        textField.tintColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 35
        textField.layer.borderColor = UIColor.black.cgColor
        textField.keyboardType = .numberPad
        textField.backgroundColor = #colorLiteral(red: 0.6654158831, green: 0.578256011, blue: 1, alpha: 1)
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var fetchCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Получить код", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        button.backgroundColor = #colorLiteral(red: 0.6654158831, green: 0.578256011, blue: 1, alpha: 1)
        button.layer.cornerRadius = 35
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK:- Initializers
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    
    private func setup() {
        backgroundColor = .white
        
        addSubview(numberTextField)
        addSubview(fetchCodeButton)
        
        NSLayoutConstraint.activate([
            numberTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberTextField.heightAnchor.constraint(equalToConstant: 70),
            numberTextField.widthAnchor.constraint(equalToConstant: 400),
            fetchCodeButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 8),
            fetchCodeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            fetchCodeButton.heightAnchor.constraint(equalToConstant: 70),
            fetchCodeButton.widthAnchor.constraint(equalToConstant: 400)
        ])
        
        fetchCodeButton.alpha = 0.5
        fetchCodeButton.isEnabled = false
        
        numberTextField.displayMode = .list
        numberTextField.delegate = self
        
        listController = FPNCountryListViewController(style: .grouped)
        listController.setup(repository: numberTextField.countryRepository)
    }
    
}

extension AuthenticationView: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
            fetchCodeButton.alpha = 1
            fetchCodeButton.isEnabled = true
            
            phoneNumber = numberTextField.getFormattedPhoneNumber(format: .International)
        } else {
            fetchCodeButton.alpha = 0.5
            fetchCodeButton.isEnabled = false
        }
    }
    
    func fpnDisplayCountryList() {
        let navigationController = UINavigationController(rootViewController: listController)
        listController.title = "Страны"
        numberTextField.text = ""
        fetchCodeButton.alpha = 0.5
        fetchCodeButton.isEnabled = false
    }
    
    
}
