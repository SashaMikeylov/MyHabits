
import Foundation
import UIKit

class InfoViewController: UIViewController {

    
//    private let label: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
//        label.text = "Привычка за 21 день"
//        
//        return label
//    }()
    
    
    
    private let infoText: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        
        
        
        return text
        
    }()
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let infoScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        
        return scroll
    }()
    
    
    
//MARK: -Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tuneView()
        addSub()
        setUp()
        configure()
    }
    
//MARK: -Func
    
    private func tuneView(){
        view.backgroundColor = .grayColor
        title = "Информация"
        
    }
    
    private func addSub(){
        
        
        view.addSubview(mainView)
        mainView.addSubview(infoScroll)
        mainView.addSubview(infoText)
//        mainView.addSubview(label)
    }
    
    private func setUp(){
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo:  safeAreaGuide.topAnchor),
            mainView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            infoScroll.topAnchor.constraint(equalTo:  mainView.topAnchor),
            infoScroll.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            infoScroll.rightAnchor.constraint(equalTo: mainView.rightAnchor),
            infoScroll.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
            
//            label.topAnchor.constraint(equalTo: infoScroll.topAnchor, constant: 30),
//            label.leftAnchor.constraint(equalTo: infoScroll.leftAnchor, constant: 10),


            infoText.topAnchor.constraint(equalTo:  infoScroll.topAnchor),
            infoText.leftAnchor.constraint(equalTo: infoScroll.leftAnchor, constant: 5),
            infoText.rightAnchor.constraint(equalTo: infoScroll.rightAnchor),
            infoText.bottomAnchor.constraint(equalTo: infoScroll.bottomAnchor),
            
            
            
        ])
    }
    private func configure(){
        infoText.text = info
    }
}
