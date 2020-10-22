//
//  BountyViewController.swift
//  BountyList
//
//  Created by 문효재 on 2020/10/20.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let bountyInfo:BountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
//        cell.imgView.image = bountyInfo.image
//        cell.nameLabel.text = bountyInfo.name
//        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("-> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }

}

class ListCell: UITableViewCell {
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

