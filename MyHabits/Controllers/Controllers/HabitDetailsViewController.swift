

import Foundation
import UIKit

final class HabitDetailsViewController: UIViewController {
    
   var index: Int = 0
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemGray5
        
        
        return table
    }()
    
    
//MARK: -life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableTune()
        tuneView()
        addTabBar()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        if del == true {
            self.navigationController?.popViewController(animated: true)
            del = false
        } else {
            title = HabitsStore.shared.habits[index].name
        }
    }
    
//MARK: -func
    
    private func tuneView(){
        navigationController?.navigationBar.tintColor = UIColor.purple
        view.backgroundColor = UIColor(named: "barColor")
        title = HabitsStore.shared.habits[index].name
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setUp(){
        
        view.addSubview(tableView)
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
        ])
        
        
    }
    
    private func addTabBar(){
        let editButton = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(tabBarAction))
    
        navigationItem.rightBarButtonItem = editButton
        
        navigationItem.rightBarButtonItem?.tintColor = .pinkColor
        navigationItem.leftBarButtonItem?.tintColor = .pinkColor
    }
    
    private func tableTune(){
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultTableCellIndetifier")
    }
    
    @objc func tabBarAction(){
        
        callPlace = "detailHabit"
        let habitViewController = HabitViewController()
        habitViewController.habitIndex = index
        let habitViewControllerNav = UINavigationController(rootViewController: habitViewController)
        habitViewControllerNav.modalPresentationStyle = .fullScreen
       
        
        present(habitViewControllerNav, animated: true, completion: nil)
        
        
    }
    
    
    
}

extension HabitDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultTableCellIndetifier", for: indexPath)
        
        let text = HabitsStore.shared.trackDateString(forIndex: indexPath.row)
        cell.textLabel?.text = text
        
        if HabitsStore.shared.habits[index].isAlreadyTakenToday {
            
            let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
            image.image = UIImage(named: "TableIcon")
            image.setImageColor(color: .pinkColor)
            cell.accessoryView = image
        
        }
        cell.selectionStyle = .none
        return cell
    }
}

extension HabitDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "АКТИВНОСТЬ"
    }
    
   
}
