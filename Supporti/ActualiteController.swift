//
//  ActualiteController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/4/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import UIKit

class ActualiteController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    

    @IBOutlet weak var userButton: UIButton!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
  
    @IBOutlet weak var pageControl: UIPageControl!
     
        
    

    
    var arrActualitePhotos = [UIImage(named: "Actualite1")!,UIImage(named: "Actualite2")!,UIImage(named: "Actualite3")!,UIImage(named: "Actualite4")!]
    var timer : Timer?
    var  currentCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.integer(forKey: "connected")==1 {
            userButton.isHidden=true
        }
       
        
        
       collectionView.delegate = self
        collectionView.dataSource = self
        pageControl.numberOfPages = arrActualitePhotos.count
        startTimer()
        // Do any additional setup after loading the view.
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
        
        
    }
    @objc func moveToNextIndex() {
        if currentCellIndex < arrActualitePhotos.count - 1{
         currentCellIndex += 1
        }else{
            currentCellIndex = 0
            
        }
        currentCellIndex += 1
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
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
