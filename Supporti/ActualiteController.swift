//
//  ActualiteController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/4/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import UIKit

class ActualiteController: UIViewController,
                           UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate {
    
    
    
    

    @IBOutlet weak var userButton: UIButton!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
  
    @IBOutlet weak var pageControl: UIPageControl!
     
    @IBOutlet weak var tableView: UITableView!
    
    private var users = [Actualite]()

    final let serverUrl = URL(string: "http://192.168.133.1:5000/actualite/")
   
    
    var arrActualitePhotos = [UIImage(named: "Actualite1")!,UIImage(named: "Actualite2")!,UIImage(named: "Actualite3")!,UIImage(named: "Actualite4")!]
    var timer : Timer?
    var  currentCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloaJson()
        if UserDefaults.standard.integer(forKey: "connected")==1 {
            userButton.isHidden=true
        }
       
        
        
       collectionView.delegate = self
        collectionView.dataSource = self
        pageControl.numberOfPages = arrActualitePhotos.count
        startTimer()
        // Do any additional setup after loading the view.
    }
    
    
    func downloaJson(){
        guard let downloadURL = serverUrl else {return}
        URLSession.shared.dataTask(with: downloadURL){data, URLResponse, Error in
            guard let data = data, Error == nil , URLResponse != nil else {
                print("il existe une erreur ")
                return}
            print("downlod en cours ")
            
            do
            {
           let decoder = JSONDecoder()
                let produits = try decoder.decode([Actualite].self, from: data)
    print("abdo")
                print(produits.count)
                 print(produits[0].titre_act + produits[0].contenu_act)
                 
                self.users = produits
              
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
                print("laaaal")
                print(decoder)
            }
            catch
            {
                print("il existe fdfr")
                
            }
        }.resume()
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
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actCell")
        
        let contentView = cell?.contentView
        
        let label = contentView?.viewWithTag(1) as! UILabel
        label.text = users[indexPath.row].titre_act
        print("ceci est le titre")
        print(users[indexPath.row].titre_act)
        print(label.text)
        let desc = contentView?.viewWithTag(2) as! UILabel
        desc.text = users[indexPath.row].contenu_act
        print("ceci est le contenu")
        print(users[indexPath.row].contenu_act)
        print(desc.text)

        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt  indexPath: IndexPath) {
            
            performSegue(withIdentifier: "ActSegue", sender: indexPath)
        }
        
    
    
    
    
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "ActSegue")
                     {
                         let indexPath = sender as! IndexPath
                         let indice = indexPath.row
                       print(indice)
                
                     
                
                let  titre = users[indice].titre_act
                let contenu = users[indice].contenu_act
                
                
            let destination = segue.destination as! ActualiteDetailsController
            destination.nomtxt = titre
            destination.desctxt = contenu
                
            
                
                
            
        }
    
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
