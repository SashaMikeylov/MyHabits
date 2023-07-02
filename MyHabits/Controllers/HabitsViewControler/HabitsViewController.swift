

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
        
        
        viewLayout.minimumLineSpacing = 10
        viewLayout.minimumInteritemSpacing = 10
        
        
        
        viewLayout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        viewLayout.headerReferenceSize = CGSize(width: 100, height: 70)
        
        
        return collection
    }()
    
    
// MARK: -Life
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tuneView()
        addSub()
        addBarButton()
        setUp()
        tuneCollection()
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
        print(habits)
        let addButton = UIBarButtonItem(image: UIImage(named: "Plus"), style: .done, target: self, action: #selector(addButtonAction))
        addButton.tintColor = .pinkColor
        navigationItem.rightBarButtonItem = addButton
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
        
        habitCollection.register(ProgressCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProgressCollectionViewCell.id)
        habitCollection.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.id)
        
        habitCollection.dataSource = self
    }
    
//MARK: -
    @objc func addButtonAction(){
        let habitViewController = HabitViewController()
        
        habitViewController.modalPresentationStyle = .fullScreen
        
        
        present(habitViewController, animated: true)
    }
    
}

extension HabitsViewController: UICollectionViewDataSource {
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.id, for: indexPath) as? HabitCollectionViewCell else{return UICollectionViewCell()}
        cell.configure(habit: habits[indexPath.row])
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
           guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProgressCollectionViewCell.id , for: indexPath) as? ProgressCollectionViewCell else {return UICollectionReusableView() }
            return cell
        default: return UICollectionReusableView()
            
        }
    }
    
    
    
}

