

import Foundation
import UIKit


class HabitCollectionViewCell: UICollectionViewCell {
    
  static var id = "HabitCollectionViewCell"
    
    private let habitName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        

        return name
    }()
    
    private let habitTime: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        
        
        return time
    }()
    
    private let habitCounter: UILabel = {
        let counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        
        
        return counter
    }()
    
    private let habitAction: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 50
        button.backgroundColor = .white
        button.layer.borderWidth = 10
        
        
        
        return button
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
        contentView.translatesAutoresizingMaskIntoConstraints = false
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
            
            habitAction.heightAnchor.constraint(equalToConstant: 30),
            habitAction.widthAnchor.constraint(equalToConstant: 30),
            habitAction.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            habitAction.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            
            contentView.heightAnchor.constraint(equalToConstant: 150),
            contentView.widthAnchor.constraint(equalToConstant: 375),
            
        ])
    }
    
    func configure(habit: Habit){
        
        habitName.text = habit.name
        habitTime.text = habit.dateString
        habitCounter.text = "Счётчик: \(habit.trackDates.count)"
        habitAction.layer.borderColor = habit.color.cgColor
        
    }
    
    
}
