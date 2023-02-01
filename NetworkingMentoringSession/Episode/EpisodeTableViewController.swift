//
//  EpisodeTableViewController.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 07.01.2023.
// oi

import UIKit

class EpisodeTableViewController: UITableViewController {
    
    var models: [Episode] = []
    var podcast: Podcast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Episode"
        
        let customCellNib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(customCellNib, forCellReuseIdentifier: "CustomCell")
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(getEpisod), for: .valueChanged)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
       getEpisod()
    }
    
    @objc func getEpisod() {
        guard let podcast = podcast else { return }
        
        
        //URL
        let url = URL(string: "https://listen-api-test.listennotes.com/api/v2/podcasts/id=\(podcast.id)")
        guard url != nil else {
            print("Errore creating url odject")
            return
        }
        
        //Request
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        //Session
        let session = URLSession(configuration: .default)
        //dataTask
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(EpisodesResult.self, from: data)
                print("DECODING RESULT \(result)")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.models = result.episodes
                    self.tableView.reloadData()
                    self.tableView.refreshControl?.endRefreshing()
                })
                
            } catch {
                print("DECODING ERROR \(error)")
                DispatchQueue.main.async {
                    self.tableView.refreshControl?.endRefreshing()
                }
            }
            
        }
        tableView.refreshControl?.beginRefreshing()
        task.resume()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        //cell.textLabel?.text = "\(episode.title) \(episode.description)"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        let episode = models[indexPath.row]
        cell.titleLable.text = episode.title
        cell.descriptionLable.text = episode.description
        cell.artImage.loadFrom(URLAddress: episode.image)
        
        return cell
    }
}



