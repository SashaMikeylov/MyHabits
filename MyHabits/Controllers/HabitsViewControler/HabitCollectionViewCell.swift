

import Foundation
import UIKit




class HabitCollectionViewCell: UICollectionViewCell {
    
  static var id = "HabitCollectionViewCell"
    
    
    
    private lazy var habitName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        

        return name
    }()
    
    private lazy var habitTime: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        time.textColor = .systemGray2
        
        
        return time
    }()
    
    private lazy var habitCounter: UILabel = {
        let counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        
        
        return counter
    }()
    
    private lazy var habitAction: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.backgroundColor = .white
        button.layer.borderWidth = 3
        button.addTarget(self, action: #selector(checkAction), for: .touchUpInside)
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private lazy var imageButton: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ButtonImage")

        
        return image
    }()
    
//MARK: -Life
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tuneView()
        addSub()
        setUp()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: -func
    
    private func tuneView(){
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
      
    }
    
    private func addSub(){
        
        contentView.addSubview(habitName)
        contentView.addSubview(habitTime)
        contentView.addSubview(habitCounter)
        contentView.addSubview(habitAction)
    }
    
    private func setUp(){
        NSLayoutConstraint.activate([
            
            
            habitName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            habitName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            
            habitTime.topAnchor.constraint(equalTo: habitName.bottomAnchor, constant: 5),
            habitTime.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            
            habitCounter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            habitCounter.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            
            habitAction.heightAnchor.constraint(equalToConstant: 60),
            habitAction.widthAnchor.constraint(equalToConstant: 60),
            habitAction.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 43),
            habitAction.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            
            
        ])
    }
    
    func configure(index: Int){
        habitName.tag = index
        
        habitName.text = HabitsStore.shared.habits[index].name
        habitName.textColor = HabitsStore.shared.habits[index].color
        habitTime.text = HabitsStore.shared.habits[index].dateString
        habitCounter.text = "Счётчик: \(HabitsStore.shared.habits[index].trackDates.count)"
        habitAction.layer.borderColor = HabitsStore.shared.habits[index].color.cgColor
        
        if HabitsStore.shared.habits[index].isAlreadyTakenToday == false {
            notSelectedButton()
        }else {
            selectedButton()
        }
    }
    
   
    func selectedButton(){
        
        habitAction.addSubview(imageButton)
        imageButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageButton.centerYAnchor.constraint(equalTo: habitAction.centerYAnchor).isActive = true
        imageButton.centerXAnchor.constraint(equalTo: habitAction.centerXAnchor).isActive = true
        imageButton.setImageColor(color:  habitName.textColor)
    }
    
    func notSelectedButton(){
        
        habitAction.backgroundColor = .white
        
    }
    
    @objc func checkAction(){
        let index = habitName.tag
        
        if HabitsStore.shared.habits[index].isAlreadyTakenToday == false {
            notSelectedButton()
            HabitsStore.shared.track(HabitsStore.shared.habits[index])
            habitCounter.text = "\(HabitsStore.shared.habits[index].trackDates.count )"
            
            NotificationCenter.default.post(name: Notification.Name("reloadData"), object: nil)
        }
    }
    
    
    
    
}
extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
