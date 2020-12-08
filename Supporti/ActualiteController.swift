//
//  ActualiteController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/4/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import UIKit

class ActualiteController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    var arrActualitePhotos = [UIImage(named: "Actualite1")!,UIImage(named: "Actualite2")!,UIImage(named: "Actualite3")!,UIImage(named: "Actualite1")!,UIImage(named: "Actualite4")!]
    override func viewDidLoad() {
        super.viewDidLoad()
       collectionView.delegate = self
        collectionView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrActualitePhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
      cell.img.image = arrActualitePhotos[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
