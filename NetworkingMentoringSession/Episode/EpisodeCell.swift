//
//  EpisodeCell.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 07.01.2023.
//

import UIKit

class EpisodeCell: UITableViewCell {
    @IBOutlet var episodeTitle : UILabel!
    @IBOutlet var episodeDescription : UILabel!
    
    func UpdateCellView(episode: Episode) {
        episodeTitle.text = episode.title
        episodeDescription.text = episode.description
    }
}
