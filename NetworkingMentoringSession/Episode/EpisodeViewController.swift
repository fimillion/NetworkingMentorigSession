import UIKit

final class EpisodeViewController: UITableViewController {
    var presenter: EpisodePresenter!
    var episodes: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Episode"
        let customCellNib = UINib(nibName: "ImageTableViewCell", bundle: nil)
        tableView.register(customCellNib, forCellReuseIdentifier: "ImageTableViewCell")
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        onRefresh()
    }
    
    @objc
    func onRefresh() {
        presenter.getEpisods()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
        let episode = episodes[indexPath.row]
        cell.setup(with: episode)
        return cell
    }
}

extension EpisodeViewController: EpisodeView {
    
    func display(_ episode: [Episode]) {
        episodes = episode
        tableView.reloadData()
    }
    
    func display(isLoding: Bool) {
        if isLoding {
            tableView.refreshControl?.beginRefreshing()
        } else {
            tableView.refreshControl?.endRefreshing()
        }
    }
}