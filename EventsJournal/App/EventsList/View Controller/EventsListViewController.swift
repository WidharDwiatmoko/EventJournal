//
//  EventsListViewController.swift
//  EventsJournal
//
//  Created by waheedCodes on 03/09/2021.
//

import UIKit
import CoreData
import AdSupport
import FirebaseAnalytics

class EventsListViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    var viewModel: EventsListViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - VIEW LIFE CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViewElements()
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.viewDidLoad()
    }
    
    // MARK: - HELPER METHODS
    
    private func setupViewElements() {
        let addItemImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: addItemImage,
                                            style: .plain,
                                            target: self,
                                            action: #selector(didTapAddEventButton))
        
        barButtonItem.tintColor = AppColor.primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EventCell.self,
                           forCellReuseIdentifier: EventCell.reuseIdentifier)
    }
    
    @objc private func didTapAddEventButton() {
        viewModel.didTapAddEvent()
        Analytics.logEvent("custom_event_ios", parameters: ["event_action": "action Native",
                                                            "event_category": "category Native",
                                                            "event_label": "label Native"])
    }
}
