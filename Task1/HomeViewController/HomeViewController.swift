//
//  HomeViewController.swift
//  Task1
//
//  Created by shahzod on 3/31/21.
//  Copyright © 2021 shahzod. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource,  UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var items : Array<Post> = Array()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    
    func initViews() {
        addNavigationBar()
        
        tableView.dataSource = self
        tableView.delegate = self
       
        
        items.append(Post(postImage: "rasm1"))
        items.append(Post(postImage: "rasm2"))
        items.append(Post(postImage: "rasm3"))
        items.append(Post(postImage: "rasm4"))
        items.append(Post(postImage: "rasm5"))
    }
    
    
    //Mark : Navigation Bar
    
    
    
    func addNavigationBar() {
      title = "Photos"
        
      let image = UIImage(named: "image")!
        
      let photo = UIImage(named: "photo")!
        
      let menu = UIImage(named: "menu")
           
      let imageButton = UIBarButtonItem(image:photo , style: .plain , target: self , action: #selector(leftTappeds))
        
      let photoButton = UIBarButtonItem(image:image , style: .plain , target: self , action: #selector(leftTapped))
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: menu , style: .plain , target: self , action: #selector(rightTapped))
        navigationItem.leftBarButtonItems = [ imageButton , photoButton ]
        
    }
    
    
    
   //Mark Navigation Bar  @objc functions
       
       @objc func leftTappeds()  {
           print("leftTappeds")
       }
    
       @objc func leftTapped()  {
            print("leftTapped")
       }
    
      @objc func rightTapped() {
        print("rightTapped")
      }
    
    //Table View Protocols
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("PostTableViewCell", owner: self , options: nil)?.first as! PostTableViewCell
      
        cell.imageViewCell.image = UIImage(named: item.postImage!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
}
