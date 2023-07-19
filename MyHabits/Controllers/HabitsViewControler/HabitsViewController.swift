

import Foundation
import UIKit

class HabitsViewController: UIViewController {
    
    var habits = HabitsStore.shared.habits
    
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var habitCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemGray5
        
        viewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        viewLayout.minimumLineSpacing = 15
        viewLayout.minimumInteritemSpacing = -20
        
        
        
        viewLayout.sectionInset = .init(top: 10, left: 15, bottom: 10, right: 15)
        
        
        
        
        return collection
    }()
    
    
// MARK: -Life
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSub()
        tuneCollection()
        tuneView()
        addBarButton()
        setUp()
        self.habitCollection.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.habitCollection.reloadData()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadDataAction(notificiation: )), name: Notification.Name("reloadData"), object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
         
    }
    
//MARK: -Func
    
    private func tuneView(){
        view.backgroundColor = .white
        title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    private func addSub(){
        
        view.addSubview(mainView)
        mainView.addSubview(habitCollection)
    }
    
    private func addBarButton(){
        
        
        let addButton = UIBarButtonItem(image: UIImage(named: "Plus"), style: .done, target: self, action: #selector(addButtonAction))
        addButton.tintColor = .pinkColor
        navigationItem.rightBarButtonItem = addButton
        navigationItem.title = "Сегодня"
    }
    
    private func setUp(){
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            mainView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            habitCollection.topAnchor.constraint(equalTo: mainView.topAnchor),
            habitCollection.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            habitCollection.rightAnchor.constraint(equalTo: mainView.rightAnchor),
            habitCollection.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
        ])
    }
    
    private func tuneCollection(){
        
        
        habitCollection.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.id)
        
        habitCollection.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.id)
        
        habitCollection.dataSource = self
        habitCollection.delegate = self
    }
    
//MARK: -
    
     func reloadCollection(){
        habitCollection.reloadData()
    }
    
    @objc func addButtonAction(){
        
       callPlace = "newHabit"
        
        let habitViewController = UINavigationController(rootViewController: HabitViewController())
        habitViewController.modalPresentationStyle = .fullScreen
        
        present(habitViewController, animated: true)
    }
    
    @objc func reloadDataAction(notificiation: Notification){
        habitCollection.reloadData()
    }
    
    
    
}

extension HabitsViewController: UICollectionViewDataSource {
    

   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HabitsStore.shared.habits.count + 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if  indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.id, for: indexPath) as? ProgressCollectionViewCell else {return UICollectionViewCell()}
            cell.config()
            
            
            return cell
        }
            
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.id, for: indexPath) as? HabitCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(index: indexPath.row - 1)
        
        
            
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            let habitDetailsViewController = HabitDetailsViewController()
            habitDetailsViewController.index = indexPath.row - 1
            navigationController?.pushViewController(habitDetailsViewController, animated: true)
            
        }
    }
    
}
extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            
            return CGSize(width: 365, height: 65)
        }else {
            
            return CGSize(width: 365, height: 150)
        }
    }
}

extension HabitsViewController: UICollectionViewDelegate {
    
    
    
    func reload(){
        habitCollection.reloadData()
    }
}
