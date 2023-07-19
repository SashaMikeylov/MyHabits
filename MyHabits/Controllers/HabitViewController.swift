
import Foundation
import UIKit

var callPlace = ""
var habitIndex = Int()
var del = false

class HabitViewController: UIViewController {
    
    
    
    var habitsViewController = HabitsViewController ()
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var habitName: UILabel = {
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
    
    private lazy var colorLabel: UILabel = {
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
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "ВРЕМЯ"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Каждый день в "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        
        return label
    }()
    
    private lazy var timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .white
        picker.tintColor = .pinkColor
       
        
        
        return picker
    }()
    
    private lazy var  deleteLabel: UIButton = {
        let label = UIButton()
        label.setTitle("Удалить привычку", for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTitleColor(.red, for: .normal)
        label.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.backgroundColor = .white
        label.addTarget(self, action: #selector(deleteHabit), for: .touchUpInside)
        
        return label
    }()
    
    private let allertController = UIAlertController(title: "Удалить привычку",
                                                     message: "",
                                                     preferredStyle: .alert)
    
//MARK: -Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tuneNavBar()
        tuneView()
        addSub()
        setUp()
       
        
        
        
        let alertAction = UIAlertAction(title: "Отмена", style: .cancel)
        let alertAction1 = UIAlertAction(title: "Удалить", style: .default) {(action) in
            HabitsStore.shared.habits.remove(at: habitIndex)
            del = true
            self.habitsViewController.reloadCollection()
            self.navigationController?.dismiss(animated: true)
        }
        
        allertController.addAction(alertAction)
        allertController.addAction(alertAction1)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        checkStatus()
    }
//MARK: -Func
    
    func tuneNavBar(){
        
        let cancelButton = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(closedButtonAction))
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.leftBarButtonItem?.tintColor = .pinkColor
        
        if callPlace == "newHabit" {
            let createButton = UIBarButtonItem(title: "Создать", style: .plain, target: self, action: #selector(createButtonAction))
            navigationItem.rightBarButtonItem = createButton
            navigationItem.rightBarButtonItem?.tintColor = .pinkColor
            
            self.navigationItem.title = "Создать"
        } else if callPlace == "detailHabit"{
            let saveButton = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveButtonAction))
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.rightBarButtonItem?.tintColor = .pinkColor
            
            navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationItem.title = "Править"
        }
        
        
    }
    
    private func tuneView(){
        view.backgroundColor = .grayColor
        
        
    }
    
    private func addSub(){
        
        view.addSubview(mainView)
        mainView.addSubview(habitName)
        mainView.addSubview(habitDescription)
        mainView.addSubview(colorLabel)
        mainView.addSubview(colorButton)
        mainView.addSubview(timeLabel)
        mainView.addSubview(dayLabel)
        mainView.addSubview(timePicker)
    }
    
    func navBar(){
    
    }
    
//MARK: -SetUp
    
    private func setUp(){
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 40),
            mainView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -40),
            
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
    
    private func checkStatus(){
        
        if callPlace == "detailHabit" {
            self.navigationItem.title = "Править"
            habitDescription.text = HabitsStore.shared.habits[habitIndex].name
            timePicker.date = HabitsStore.shared.habits[habitIndex].date
            colorButton.backgroundColor = HabitsStore.shared.habits[habitIndex].color
            
            view.addSubview(deleteLabel)
            
            NSLayoutConstraint.activate([
                
                mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                deleteLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10),
                deleteLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
                deleteLabel.heightAnchor.constraint(equalToConstant: 40),
                
                
                
            ])
        }
    }
    
    
//MARK: -objc func

    
    @objc func closedButtonAction(_sender: UIButton){
        self.dismiss(animated: true)
    }
    
    @objc func colorAction(){
        let colorPicker = UIColorPickerViewController()
        colorPicker.title = "Цвет привычки"
        colorPicker.supportsAlpha = false
        colorPicker.delegate = self
        colorPicker.modalPresentationStyle = .popover
        colorPicker.popoverPresentationController?.sourceItem = self.navigationItem.rightBarButtonItem
        self.present(colorPicker, animated: true)
        
    }
    
    
    @objc func saveButtonAction(){
        
        HabitsStore.shared.habits[habitIndex].name = habitDescription.text ?? ""
        HabitsStore.shared.habits[habitIndex].color = colorButton.backgroundColor ?? .orange
        HabitsStore.shared.habits[habitIndex].date = timePicker.date
        HabitsStore.shared.save()
        
        
        
        dismiss(animated: true)
    }
                                             
                                             
    @objc func createButtonAction(){
        let newHabit = Habit(name: habitDescription.text ?? "Без названия ",
                             date: timePicker.date,
                             color: colorButton.backgroundColor ?? .orangeColor)
        
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        habitsViewController.reloadCollection()
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    @objc func deleteHabit(){
        
        allertController.message = "Вы хотите удалить привычку \(HabitsStore.shared.habits[habitIndex].name) ?"
        self.present(allertController, animated: true)
        
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
