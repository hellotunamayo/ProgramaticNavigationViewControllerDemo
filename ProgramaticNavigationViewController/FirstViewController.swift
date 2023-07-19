//
//  FirstViewController.swift
//  UIKitDemo
//
//  Created by Minyoung Yoo on 2023/07/14.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabOne: UIViewController = FirstViewController()
        let tabOneItem: UITabBarItem = UITabBarItem(title: "tab one", image: UIImage(systemName: "applewatch.slash"), selectedImage: UIImage(systemName: "applewatch"))
        
        tabOne.tabBarItem = tabOneItem
        
        let tabTwo: UIViewController = SecondViewController()
        let tabTwoItem: UITabBarItem = UITabBarItem(title: "tab two", image: UIImage(systemName: "person.crop.circle.badge.minus"), selectedImage: UIImage(systemName: "person.crop.circle.badge.checkmark"))
        
        tabTwo.tabBarItem = tabTwoItem
        
        let tabThree: UIViewController = ThirdViewController()
        let tabThreeItem: UITabBarItem = UITabBarItem(title: "tab three", image: UIImage(systemName: "square.and.arrow.up"), selectedImage: UIImage(systemName: "square.and.arrow.up.trianglebadge.exclamationmark"))
        
        tabThree.tabBarItem = tabThreeItem
        
        self.viewControllers = [tabOne, tabTwo, tabThree]
    }
}

class FirstViewController: UIViewController{
    
    //button
    let buttonToSecondView: UIButton = UIButton()
    let buttonToThirdView: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "First View"
        view.backgroundColor = .systemBackground
        
        //configure buttons
        setupFirstButton()
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
//        targetVC.modalPresentationStyle = .fullScreen
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
        
        view.backgroundColor = .systemBackground
        
        
        title = "second"
        
        let button = UIButton()
        button.setTitle("second", for: .normal)
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
        title = "third"
        view.backgroundColor = .systemCyan
    }
}
