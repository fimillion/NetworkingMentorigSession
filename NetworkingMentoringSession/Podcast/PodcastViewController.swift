import UIKit

final class PodcastViewController: UITableViewController {
    var presenter: PodcastPresenter!
    var podcasts: [Podcast] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        self.navigationItem.title = "Podcast"
        let customCellNib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(customCellNib, forCellReuseIdentifier: "CustomCell")
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tableView.rowHeight = UITableView.automaticDimension
        onRefresh()
    }
    @objc
    func onRefresh() {
        presenter.getPodcasts()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    // MARK: - The visual representation of a single row in a table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        let podcast = podcasts[indexPath.row]
        cell.titleLable.text = podcast.title
        cell.descriptionLable.text = podcast.description
        cell.artImage.loadFrom(URLAddress: podcast.image)
        return cell
    }
    // MARK: - Navigation to Episode
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let podcast = podcasts[indexPath.row]
        let episodeVC = EpisodeComposer.build(podcastId: podcast.id)
        self.navigationController?.pushViewController(episodeVC, animated: true)
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
