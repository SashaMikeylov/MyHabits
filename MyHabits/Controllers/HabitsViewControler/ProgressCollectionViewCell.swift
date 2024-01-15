

import Foundation
import UIKit

final class ProgressCollectionViewCell: UICollectionViewCell {
    
    static let id = "ProgressCollectionViewCell"
    
    private lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Всё получится!"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .systemGray2
        
      
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.tintColor = .pinkColor
        view.trackTintColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.progress = HabitsStore.shared.todayProgress
        
        return view
    }()
    
    private lazy var progressNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        
        
        return label
    }()
    
//MARK: - Life
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tuneCell()
        addSub()
        setUp()
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Func
    
    
    
    private func tuneCell(){
        
        backgroundColor = UIColor(named: "barColor")
        layer.cornerRadius = 10
        
        
    }
    
    private func addSub(){
        
        addSubview(progressLabel)
        addSubview(progressView)
        addSubview(progressNumber)
    }
    
    private func setUp(){
        
        
        
        NSLayoutConstraint.activate([
            
            progressLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            progressLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            progressView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
            progressView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            progressView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            progressView.heightAnchor.constraint(equalToConstant: 8),
            
            
            progressNumber.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            progressNumber.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
        ])
        
    }
    func config(){
        progressNumber.text = "\(Int(HabitsStore.shared.todayProgress*100)) %"
        progressView.progress = HabitsStore.shared.todayProgress
    }
    
}
