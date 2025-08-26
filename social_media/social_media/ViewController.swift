//
//  ViewController.swift
//  social_media
//
//  Created by muhammadali on 3/11/1404 AP.
//

import UIKit

class ViewController: UIViewController {
    var posts = [PostModel]()
    var stories = [StoryModel]()
  
    @IBOutlet weak var tableView: UITableView!
    
    //    @IBAction func buttonFirst(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: .main)
//        let view3 = storyboard.instantiateViewController(withIdentifier: "ViewControllerthreeID")
//        navigationController?.pushViewController(view3, animated: true)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle1()
        setPosts()
        setStories()
        // Do any additional setup after loading the view.
    }
    func setStories(){
        stories.append(StoryModel(id: "b1", imageData: UIImage(named: "Image5")!.jpegData(compressionQuality: 1)!))
        stories.append(StoryModel(id: "b2", imageData: UIImage(named: "Image6")!.jpegData(compressionQuality: 1)!))
        stories.append(StoryModel(id: "b3", imageData: UIImage(named: "Image7")!.jpegData(compressionQuality: 1)!))
        stories.append(StoryModel(id: "b4", imageData: UIImage(named: "Image8")!.jpegData(compressionQuality: 1)!))
        stories.append(StoryModel(id: "b5", imageData: UIImage(named: "Image9")!.jpegData(compressionQuality: 1)!))
        stories.append(StoryModel(id: "b6", imageData: UIImage(named: "Image10")!.jpegData(compressionQuality: 1)!))
        

    }
    func setPosts(){
        posts.append(PostModel(id: "1a", imageData: UIImage(named: "Image")!.jpegData(compressionQuality: 1)!, Name: "koss", data: "now", caption: "A new hire at the National Security Agency goes under cover to try to recover money stolen from her boss.", isLike: true))
        
        posts.append(PostModel(id: "2a", imageData: UIImage(named: "Image2")!.jpegData(compressionQuality: 1)!, Name: "ali", data: "now", caption: "A new hire at the National Security Agency goes under cover to try to recover money stolen from her boss.", isLike: true))
        posts.append(PostModel(id: "3a", imageData: UIImage(named: "Image3")!.jpegData(compressionQuality: 1)!, Name: "reza", data: "now", caption: "A new hire at the National Security Agency goes under cover to try to recover money stolen from her boss.", isLike: false))
        posts.append(PostModel(id: "4a", imageData: UIImage(named: "Image4")!.jpegData(compressionQuality: 1)!, Name: "alios", data: "now", caption: "A new hire at the National Security Agency goes under cover to try to recover money stolen from her boss.", isLike: true))
    }
    
        func setTitle1(){
        let imageT = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageT.contentMode = .scaleAspectFit
        imageT.image = UIImage(named: "Image1")
        navigationItem.titleView = imageT
    }
}
extension ViewController: UITableViewDelegate{
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCellID") as! PostTableViewCell
        cell.delegateP = self
        cell.configure(post: posts[indexPath.row])
        
        return cell
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    }
  
}
extension ViewController: UICollectionViewDelegate{
    
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCellID", for: indexPath) as! StoryCollectionViewCell
        cell.configure(story: stories[indexPath.row])
        return cell
    }
    
    
}
extension ViewController: PostTableViewCellDelegate{
    func changedLike(post: PostModel) {
        for i in 0..<posts.count{
          if posts[i].id == post.id {
                posts[i].isLike = !posts[i].isLike
              tableView.reloadData()
              return
            }
        }
    }
    
    
}
