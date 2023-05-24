import Foundation

protocol PodcastRouter: AnyObject {
    func route(with podcast: Podcast)
}
