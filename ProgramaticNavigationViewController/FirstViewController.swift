//
//  FirstViewController.swift
//  UIKitDemo
//
//  Created by Minyoung Yoo on 2023/07/14.
//

import UIKit

class FirstViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "First View"
        view.backgroundColor = .systemBackground
        
        //configure button
        let buttonToSecondView: UIButton = UIButton()
        setupFirstButton()
        
        let buttonToThirdView: UIButton = UIButton()
        setupSecondButton()
        
        //add constraints
        let constraints: [NSLayoutConstraint] = [
            //to second view
            buttonToSecondView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonToSecondView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonToSecondView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonToSecondView.heightAnchor.constraint(equalToConstant: 40),
            //to third view
            buttonToThirdView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonToThirdView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonToThirdView.topAnchor.constraint(equalTo: buttonToSecondView.bottomAnchor, constant: 10),
            buttonToThirdView.heightAnchor.constraint(equalToConstant: 40),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        func setupFirstButton() -> Void{
            buttonToSecondView.setTitle("Go to Second View", for: .normal)
            buttonToSecondView.setTitleColor(.black, for: .normal)
            buttonToSecondView.translatesAutoresizingMaskIntoConstraints = false
            buttonToSecondView.addTarget(self, action: #selector(navigateToSecondView), for: .touchUpInside)
            view.addSubview(buttonToSecondView)
        }
        
        func setupSecondButton() -> Void{
            buttonToThirdView.setTitle("Go to Third View", for: .normal)
            buttonToThirdView.setTitleColor(.black, for: .normal)
            buttonToThirdView.translatesAutoresizingMaskIntoConstraints = false
            buttonToThirdView.addTarget(self, action: #selector(navigateToThirdView), for: .touchUpInside)
            view.addSubview(buttonToThirdView)
        }
    }

    @objc func navigateToSecondView(viewController: UIViewController){
        let targetVC = SecondViewController()
        targetVC.title = "sheet"
        present(targetVC, animated: true)
    }
    
    @objc func navigateToThirdView(viewController: UIViewController){
        let targetVC = ThirdViewController()
        navigationController?.pushViewController(targetVC, animated: true)
    }
}

class SecondViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "second view"
        let button = UIButton()
        button.setTitle("close", for: .normal)
        button.addTarget(self, action: #selector(dismissSheet), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.backgroundColor = .systemTeal
    }
    @objc func dismissSheet(){
        dismiss(animated: true)
    }
}

class ThirdViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "third view"
        view.backgroundColor = .systemCyan
    }
}