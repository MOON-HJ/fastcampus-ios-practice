//
//  BountyViewController.swift
//  BountyList
//
//  Created by 문효재 on 2020/10/20.
//

import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let viewModel = BountyViewModel()
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
            if let index = sender as? Int {
                vc?.viewModel.update(model: viewModel.bountyInfo(at: index))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let bountyInfo:BountyInfo = viewModel.bountyInfo(at: indexPath.item)
        cell.update(info: bountyInfo)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing:CGFloat = 10
        let textAreaHeight:CGFloat = 65
        
        let width:CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let float:CGFloat = width * 10 / 7 + textAreaHeight
        
        return CGSize(width: width, height: float)
    }
}

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}



class BountyViewModel{
    let bountyInfoList:[BountyInfo] = [
        BountyInfo(name:"brook", bounty:3300000),
        BountyInfo(name:"chopper", bounty:50),
        BountyInfo(name:"franky", bounty:4400000),
        BountyInfo(name:"luffy", bounty:30000000),
        BountyInfo(name:"nami", bounty:1600000),
        BountyInfo(name:"robin", bounty:8000000),
        BountyInfo(name:"sanji", bounty:7700000),
        BountyInfo(name:"zoro", bounty:12000000)
    ]
    
    var sortedList: [BountyInfo] {
        return bountyInfoList.sorted{$0.bounty > $1.bounty}
    }
    
    var numOfBountyInfoList:Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}

