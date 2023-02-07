import UIKit

final class GenresViewController: UITableViewController {
    var presenter = GenresPresenter()
    var genres: [Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        self.navigationItem.title = "Genre"
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        onRefresh()
    }
    
    @objc
    func onRefresh() {
        presenter.getGenres()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    // MARK: - The visual representation of a single row in a table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        let genre = genres[indexPath.row]
        cell.textLabel?.text = genre.name
        return cell
    }
    
    // MARK: - Navigation to Podcast
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = genres[indexPath.row]
        let podcastVC = PodcastComposer.build(genreId: genre.id)
        self.navigationController?.pushViewController(podcastVC, animated: true)
    }
}

extension GenresViewController: GenresView {
    
    func display(_ genres: [Genre]) {
        self.genres = genres
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
