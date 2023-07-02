

import Foundation
import UIKit

class ProgressCollectionViewCell: UICollectionReusableView {
    
    static let id = "ProgressCollectionViewCell"
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Всё получится!"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .systemGray2
        
        
        return label
    }()
    
    private let progressView: UIProgressView = {
        let view = UIProgressView()
        view.backgroundColor = .systemGray2
        view.trackTintColor = .systemGray2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private let progressNumber: UILabel = {
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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Func
    
    private func tuneCell(){
        backgroundColor = .white
        layer.cornerRadius = 10
        
        
    }
    
    private func addSub(){
        
        addSubview(progressLabel)
        addSubview(progressView)
        addSubview(progressNumber)
    }
    
    private func setUp(){
        
        progressNumber.text = "\(Int(progressView.progress)) %"
        progressView.progress = HabitsStore.shared.todayProgress
        
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
    
}
