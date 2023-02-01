// 

import UIKit

class ViewController: UITableViewController {
    let presentor = GenresPresentor()
    var models: [Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentor.view = self
        self.navigationItem.title = "Genre"
        tableView.refreshControl = UIRefreshControl()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        onRefresh()
    }
    
    @objc
    func onRefresh() {
        presentor.onRefresh()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    // MARK: -
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        let genre = models[indexPath.row]
        cell.textLabel?.text = genre.name
        return cell
    }
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = models[indexPath.row]
        presentor.onSelect(genre)
        let podcastVC = PodcastComposer.build(genreId: genre.id)
        self.navigationController?.pushViewController(podcastVC, animated: true)
    }
}


