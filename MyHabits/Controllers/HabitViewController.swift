
import Foundation
import UIKit

class HabitViewController: UIViewController {
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var closedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .grayColor
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(.pinkColor, for: .normal)
        button.addTarget(self, action: #selector(closedButtonAction(_sender: )), for: .touchUpInside)
        
        return button
    }()
    
    private let createTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.text = "Создать"
        
        return label
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.pinkColor, for: .normal)
        button.backgroundColor = .grayColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        
        return button
    }()
    
    private let habitName: UILabel = {
        let name = UILabel()
        name.text = "НАЗВАНИЕ"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        return name
    }()
    
    private lazy var habitDescription: UITextField = {
        let descrip = UITextField()
        descrip.translatesAutoresizingMaskIntoConstraints = false
        descrip.backgroundColor = .white
        descrip.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        descrip.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        descrip.textColor = .blueColor
        descrip.autocapitalizationType = .none
        descrip.keyboardType = UIKeyboardType.default
        descrip.clearButtonMode = .whileEditing
        descrip.returnKeyType = UIReturnKeyType.done
        descrip.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        descrip.delegate = self
        
        return descrip
    }()
    
    private let colorLabel: UILabel = {
        let color = UILabel()
        color.text = "ЦВЕТ"
        color.translatesAutoresizingMaskIntoConstraints = false
        color.textColor = .black
        color.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        return color
    }()
    
    private lazy var colorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orangeColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(colorAction), for: .touchUpInside)
        
        return button
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "ВРЕМЯ"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    
    private var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Каждый день в "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        
        return label
    }()
    
    private let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .white
        picker.tintColor = .pinkColor
       
        
        
        return picker
    }()
    
    
//MARK: -Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tuneView()
        addSub()
        setUp()
        
    }
    
//MARK: -Func
    
    private func tuneView(){
        view.backgroundColor = .grayColor
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        
    }
    
    private func addSub(){
        
        view.addSubview(mainView)
        view.addSubview(closedButton)
        view.addSubview(createTitle)
        view.addSubview(saveButton)
        mainView.addSubview(habitName)
        mainView.addSubview(habitDescription)
        mainView.addSubview(colorLabel)
        mainView.addSubview(colorButton)
        mainView.addSubview(timeLabel)
        mainView.addSubview(dayLabel)
        mainView.addSubview(timePicker)
    }
    
    
//MARK: -SetUp
    
    private func setUp(){
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 40),
            mainView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -40),
            
            closedButton.heightAnchor.constraint(equalToConstant: 20),
            closedButton.widthAnchor.constraint(equalToConstant: 100),
            closedButton.bottomAnchor.constraint(equalTo: mainView.topAnchor, constant: -10),
            closedButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            
            createTitle.bottomAnchor.constraint(equalTo: mainView.topAnchor, constant: -10),
            createTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            saveButton.bottomAnchor.constraint(equalTo: mainView.topAnchor, constant: -3),
            saveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            
            habitName.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            habitName.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 15),
            
            habitDescription.topAnchor.constraint(equalTo: habitName.bottomAnchor, constant: 10),
            habitDescription.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 15),
            habitDescription.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -15),
            habitDescription.heightAnchor.constraint(equalToConstant: 40),
            
            colorLabel.topAnchor.constraint(equalTo: habitDescription.bottomAnchor,constant: 15),
            colorLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor,constant: 15),
            
            colorButton.heightAnchor.constraint(equalToConstant: 40),
            colorButton.widthAnchor.constraint(equalToConstant: 40),
            colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 10),
            colorButton.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 15),
            
            timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 20),
            timeLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 15),
            
            dayLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            dayLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 15),
            
            
            timePicker.topAnchor.constraint(equalTo: timeLabel.bottomAnchor,constant: 5),
            timePicker.leftAnchor.constraint(equalTo: dayLabel.rightAnchor, constant: 5),
        ])
    }
//MARK: -objc func

    
    @objc func closedButtonAction(_sender: UIButton){
        self.dismiss(animated: true)
    }
    
    @objc func colorAction(){
        let colorPicker = UIColorPickerViewController()
        colorPicker.title = "Habit Color"
        colorPicker.supportsAlpha = false
        colorPicker.delegate = self
        colorPicker.modalPresentationStyle = .popover
        colorPicker.popoverPresentationController?.sourceItem = self.navigationItem.rightBarButtonItem
        self.present(colorPicker, animated: true)
        
    }
    
    @objc func saveButtonAction(){
        let newHabit = Habit(name: habitDescription.text ?? "Без названия ",
                             date: timePicker.date,
                             color: colorButton.backgroundColor ?? .orangeColor)
        
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        dismiss(animated: true)
    }
    
}

extension HabitViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
extension HabitViewController: UIColorPickerViewControllerDelegate{
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        colorButton.backgroundColor = viewController.selectedColor
    }
    
}
