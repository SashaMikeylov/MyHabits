
import Foundation
import UIKit

final class InfoViewController: UIViewController {
    
    private lazy var  infoText: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.text = String.infoText
        text.backgroundColor = UIColor(named: "backColor")
        text.textColor = UIColor(named: "textColor")
        
        return text
        
    }()
    
    
    private lazy var  mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "backColor")
        view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
    }()
    
    private lazy var infoScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = UIColor(named: "backColor")
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        scroll.alwaysBounceVertical = true
        
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
        title = "Информация"
    }
    
    private func setUp(){
        
        view.addSubview(infoScroll)
        view.addSubview(mainView)
        mainView.addSubview(infoText)
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            infoScroll.topAnchor.constraint(equalTo:  safeAreaGuide.topAnchor),
            infoScroll.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
            infoScroll.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
            infoScroll.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
           
            
            mainView.topAnchor.constraint(equalTo:  infoScroll.topAnchor),
            mainView.leftAnchor.constraint(equalTo: infoScroll.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: infoScroll.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: infoScroll.bottomAnchor),
            mainView.widthAnchor.constraint(equalTo: infoScroll.widthAnchor),
            
            infoText.topAnchor.constraint(equalTo:  mainView.topAnchor),
            infoText.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            infoText.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            infoText.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
        ])
    }
}
