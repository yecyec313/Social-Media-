//
//  StoryCollectionViewCell.swift
//  social_media
//
//  Created by muhammadali on 3/11/1404 AP.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    var story: StoryModel!
    
    func configure(story: StoryModel){
        self.story = story
        imageView.image = UIImage(data: story.imageData)
    }
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 50
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 2
    }
}
