import UIKit

final class GenresViewController: UITableViewController {
    var genres: [Genre] = []
    var presenter: GenresPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onRefresh()
        title = "Genre"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))!
        let genre = genres[indexPath.row]
        cell.textLabel?.text = genre.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = genres[indexPath.row]
        presenter.onSelectGanre(genre)
    }
}

extension GenresViewController: GenresView {
    
    func display(_ genre: [Genre]) {
        genres = genre
        tableView.reloadData()
    }
}
