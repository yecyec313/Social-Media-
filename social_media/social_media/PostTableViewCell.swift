//
//  PostTableViewCell.swift
//  social_media
//
//  Created by muhammadali on 3/11/1404 AP.
//

import UIKit
protocol PostTableViewCellDelegate{
    func changedLike(post: PostModel)
}
class PostTableViewCell: UITableViewCell {
    var delegateP: PostTableViewCellDelegate!
    @IBAction func buttonLikeClicked(_ sender: Any) {
        delegateP.changedLike(post: post)
    }
    var post: PostModel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var buttonLike: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    func configure(post: PostModel) {
        self.post = post
        postImage.image = UIImage(data: post.imageData)
        NameLabel.text = post.Name
        captionLabel.text = post.caption
        dataLabel.text = post.data
        if post.isLike {
            buttonLike.tintColor = .red
            buttonLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            buttonLike.tintColor = .label
            buttonLike.setImage(UIImage(systemName: "heart"), for: .normal)
        }
            
        
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
//extension PostTableViewCell: PostTableViewCellDelegate{
//    func changedLike(post: PostModel) {
//        <#code#>
//    }
//    
//    
//}
