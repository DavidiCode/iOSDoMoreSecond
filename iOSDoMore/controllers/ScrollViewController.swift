//
//  ScrollViewController.swift
//  iOSDoMore
//
//  Created by Akbar Ibodulloyev on 04/04/24.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }

    // MARK: - Methods
       
       func initViews(){
           addNavigationBar()
       }
       
       func addNavigationBar(){

           let back = UIImage(named:"ic_back")
           navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backTapped))
           title = "Scroll View"
       }
       
       // MARK: - Actions
       
       @objc func backTapped(){
           navigationController?.popViewController(animated: true)
       }


}
