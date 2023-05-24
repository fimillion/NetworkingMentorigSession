import UIKit

final class PodcastViewController: UITableViewController {
    var presenter: PodcastPresenter!
    var podcasts: [Podcast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onRefresh()
        title = "Podcast"
        let customCellNib = UINib(nibName: "ImageTableViewCell", bundle: nil)
        tableView.register(customCellNib, forCellReuseIdentifier: "ImageTableViewCell")
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
        
        let podcast = podcasts[indexPath.row]
        cell.setup(with: podcast)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let podcast = podcasts[indexPath.row]
        presenter.onSelectPodcast(podcast)
    }
}

extension PodcastViewController: PodcastView {
    
    func display(_ podcasts: [Podcast]) {
        self.podcasts = podcasts
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
