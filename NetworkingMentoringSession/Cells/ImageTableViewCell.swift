//
//  CustomTableViewCell.swift
//  NetworkingMentoringSession
//
//  Created by Yefim on 11.01.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLable: UILabel!
    @IBOutlet private weak var descriptionLable: UILabel!
    @IBOutlet private weak var artImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {}
    
    func setup(with episode: Episode) {
        self.titleLable.text = episode.title
        self.descriptionLable.text = episode.description
        self.artImage.loadFrom(URLAddress: episode.image)
        
    }
    
    func setup(with podcast: Podcast) {
        self.titleLable.text = podcast.title
        self.descriptionLable.text = podcast.description
        self.artImage.loadFrom(URLAddress: podcast.image)
        
    }
}
