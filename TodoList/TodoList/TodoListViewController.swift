//
//  TodoListViewController.swift
//  TodoList
//
//  Created by 문효재 on 2020/10/28.
//

import UIKit

class TodoListViewController: UIViewController {

    let viewModel = TodoViewModel()
//    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var inputViewBottom: NSLayoutConstraint!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var isTodayButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadTasks()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func isTodayButtonTapped(_ sender: Any){
        
    }
    
    @IBAction func isTaskButtonTapped(_ sender: Any){
        
        
    }

}

extension TodoListViewController {
    @objc private func adjustInputView(noti: Notification){
        guard let userInfo = noti.userInfo else { return  }
    }
}

extension TodoListViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.todayTodos.count

        default:
            return viewModel.upcommingTodos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todoCell", for: indexPath) as? TodoListCell else {
            return UICollectionViewCell()
        }
        var todo:Todo
        
        switch indexPath.section {
        case 0:
            todo = viewModel.todayTodos[indexPath.item]

        default:
            todo = viewModel.upcommingTodos[indexPath.item]
        }

        cell.updateUI(todo: todo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "todoHeader", for: indexPath) as? TodoListHeader
            else { return UICollectionReusableView() }
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension TodoListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: 사이즈 계산하기
        let width = collectionView.bounds.width
        let height:CGFloat = 60
        return CGSize(width: width, height: height)
    }
}

class TodoListCell: UICollectionViewCell {
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var deleteButton: UIButton!
        
    var doneButtonTapHandler: ((Bool) -> Void)?
    var deleteButtonTapHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reset()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
    
    func updateUI(todo: Todo){
        
    }
    
    private func check(_ show: Bool){
        descriptionLabel.alpha = show ? 0.0 : 0.5
    }
    
    private func reset(){
        
    }
}



class TodoListHeader:UICollectionReusableView {
    @IBOutlet weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
