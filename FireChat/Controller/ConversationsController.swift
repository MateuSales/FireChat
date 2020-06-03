//
//  ConversationsController.swift
//  FireChat
//
//  Created by Mateus Sales on 18/05/20.
//  Copyright © 2020 Mateus Sales. All rights reserved.
//

import UIKit
import Firebase

private let reuseIndentifier = "ConversationCell"

class ConversationsController: UIViewController {
    
    // MARK: - Properties
    
    private let tableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        authenticateUser()
        
    }
    
    // MARK: - API
    
    func authenticateUser() {
        if Auth.auth().currentUser?.uid == nil {
            presentLoginScreen()
        } else {
            print(Auth.auth().currentUser?.uid)
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error from LOGOUT")
        }
    }
    
    // MARK: - Selectors
    
    @objc func showProfile() {
        logout()
    }
    
    // MARK: - Helpers
    
    func presentLoginScreen() {
        DispatchQueue.main.async {
            let controller = LoginController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white

        configureNavigationBar()
        configureTableView()
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showProfile))
        
    }
    
    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIndentifier)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    
    func configureNavigationBar() {
        let appearence = UINavigationBarAppearance()
        appearence.configureWithOpaqueBackground()
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearence.backgroundColor = .systemPurple
        
        let navBar = navigationController?.navigationBar
        navBar?.compactAppearance = appearence
        navBar?.standardAppearance = appearence
        navBar?.scrollEdgeAppearance = appearence
        
        navBar?.prefersLargeTitles = true
        navigationItem.title = "Messages"
        navBar?.tintColor = .white
        navBar?.isTranslucent = true
        
        navBar?.overrideUserInterfaceStyle = .dark
        
    }
}

extension ConversationsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension ConversationsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier, for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
    
}
