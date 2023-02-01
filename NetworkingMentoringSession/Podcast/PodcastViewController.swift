//
//  BestPodcastViewController.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 04.01.2023.
//

import UIKit

class PodcastViewController: UITableViewController {
    //Linc for Controller to Presentor change
    var presenter: PodcastPresenter!
    var podcasts: [Podcast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Podcast"
        
        let customCellNib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(customCellNib, forCellReuseIdentifier: "CustomCell")
        tableView.refreshControl = UIRefreshControl()
        tableView.rowHeight = UITableView.automaticDimension
        onRefresh()
    }
    
    @objc
    func onRefresh() {
        presenter.onRefresh()
    }
 
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    // MARK: - The visual representation of a single row in a table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        let podcast = podcasts[indexPath.row]
        cell.titleLable.text = podcast.title
        cell.descriptionLable.text = podcast.description
        cell.artImage.loadFrom(URLAddress: podcast.image)
        return cell
    }
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let podcast = podcasts[indexPath.row]
        let episodeVC = EpisodeTableViewController()
        episodeVC.podcast = podcast
        self.navigationController?.pushViewController(episodeVC, animated: true)
    }
    
}
