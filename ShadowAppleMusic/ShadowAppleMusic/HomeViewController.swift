//
//  HomeViewController.swift
//  ShadowAppleMusic
//
//  Created by 문효재 on 2020/10/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let trackManager: TrackManager = TrackManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}


extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackManager.tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        return UICollectionViewCell()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        let track = trackManager.track(at: indexPath.item)
        cell.updateUI(item: track)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let item = trackManager.todayTrack else {
                return UICollectionReusableView()
            }

            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? TrackCollectionHeaderView else {
                return UICollectionReusableView()
            }
            
    
            header.update(with: item)
            header.tapHandler = {item -> Void in
                let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
                guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return }
                playerVC.simplePlayer.replaceCurrentItem(with: item)
                self.present(playerVC, animated: true, completion: nil)

            }
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}


extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
        guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return }
     
        let item = trackManager.tracks[indexPath.item]
        playerVC.simplePlayer.replaceCurrentItem(with: item)
        
        present(playerVC, animated: true, completion: nil)
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing:CGFloat = 20
        let margin:CGFloat = 40
        let width:CGFloat = (view.bounds.width - itemSpacing - margin)/2
        let height = width + 60
        
        return CGSize(width: width, height: height)
    }
}

