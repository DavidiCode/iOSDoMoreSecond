//
//  HomeViewController.swift
//  iOSDoMore
//
//  Created by Akbar Ibodulloyev on 04/04/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    @IBOutlet var collectionView: UICollectionView!
    
    let numberOfColumns: CGFloat = 2
    var items : Array<Item> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }

//MARK: - Method
    
    func initViews(){
        addNavigationBar()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
                
                if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                    let screenSize: CGRect = UIScreen.main.bounds
                    let cellWidth = screenSize.width / numberOfColumns - 15
                    flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
                }
        
                items.append(Item(title: "Another image", image: "photo_10"))
                items.append(Item(title: "Some image", image: "photo_1"))
                items.append(Item(title: "Another image", image: "photo_2"))
                items.append(Item(title: "Some image", image: "photo_3"))
                items.append(Item(title: "Another image", image: "photo_4"))
                items.append(Item(title: "Some image", image: "photo_5"))
                items.append(Item(title: "Another image", image: "photo_6"))
                items.append(Item(title: "Another image", image: "photo_7"))
                items.append(Item(title: "Another image", image: "photo_8"))
                items.append(Item(title: "Another image", image: "photo_9"))
                items.append(Item(title: "Another image", image: "photo_10"))
        
    }
    
    func addNavigationBar(){

           let scroll = UIImage(named:"ic_scroll")
           navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(scrollTapped))
           
           title = "Collection View"
       }
    
    func callScrollController(){
            let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    

//MARK: - Action
    
    @objc func scrollTapped(){
           callScrollController()
       }
    
    
//MARK: - Collection View
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        cell.collectionImage.image = UIImage(named: item.image!)
        cell.collectionText.text = item.title
        return cell
    }
    

}
