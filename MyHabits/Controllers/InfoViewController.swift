
import Foundation
import UIKit

final class InfoViewController: UIViewController {
    
    private let infoText: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.text = String.infoText
        text.backgroundColor = UIColor(named: "backColor")
        
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
        setUp()
    }
    
//MARK: -Func
    
    private func tuneView(){
        view.backgroundColor = UIColor(named: "barColor")
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Информация"
        
    }
        
    
    private func setUp(){
        
        view.addSubview(mainView)
        mainView.addSubview(infoScroll)
        mainView.addSubview(infoText)
        
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
            
            infoText.topAnchor.constraint(equalTo:  infoScroll.topAnchor),
            infoText.leftAnchor.constraint(equalTo: infoScroll.leftAnchor),
            infoText.rightAnchor.constraint(equalTo: infoScroll.rightAnchor),
            infoText.bottomAnchor.constraint(equalTo: infoScroll.bottomAnchor),
            
        ])
    }
}
