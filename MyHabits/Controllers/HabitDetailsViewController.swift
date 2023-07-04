

import Foundation

import UIKit

class HabitDetailsViewController: UIViewController {
    
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
        addSub()
        setUp()
    }
//MARK: -func
    
    private func tuneView(){
        
        view.backgroundColor = .white
        title = HabitsStore.shared.habits[index].name
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    private func addSub(){
        
        view.addSubview(tableView)
    }
    
    
    private func setUp(){
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
    }
    
    private func tableTune(){
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultTableCellIndetifier")
    }
    
    @objc func tabBarAction(){
        
        callPlace = "detailHabit"
        
        let habitViewController = UINavigationController(rootViewController: HabitViewController())
        habitViewController.modalPresentationStyle = .fullScreen
       
        
        present(habitViewController, animated: true, completion: nil)
        
        
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
        
        if HabitsStore.shared.habit(HabitsStore.shared.habits[index], isTrackedIn: HabitsStore.shared.dates[indexPath.row]) {
            
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
