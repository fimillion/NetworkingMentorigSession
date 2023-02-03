//
//  EpisodeTableViewController.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 07.01.2023.
// oi

import UIKit

final class EpisodeTableViewController: UITableViewController {
    var presenter: EpisodePresenter!
    var episodes: [Episode] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Episode"
        let customCellNib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(customCellNib, forCellReuseIdentifier: "CustomCell")
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        onRefresh()
    }
    @objc
    func onRefresh() {
        presenter.onRefresh()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    // MARK: - The visual representation of a single row in a table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        let episode = episodes[indexPath.row]
        cell.titleLable.text = episode.title
        cell.descriptionLable.text = episode.description
        cell.artImage.loadFrom(URLAddress: episode.image)
        return cell
    }
}
