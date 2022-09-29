//
//  TaskCell.swift
//  To-Do App
//
//  Created by Konstantin Bratchenko on 28.09.2022.
//

import UIKit

final class TaskCell: UITableViewCell {
    
    private let hStackView = UIStackView()
    private let symbolLabel = UILabel()
    private let titleLabel = UILabel()
    
    var taskViewModel: TaskViewModel? {
        didSet {
            guard let taskViewModel = taskViewModel else { return }
            setCellDataWith(taskViewModel)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    

}

extension TaskCell {
    private func configureViews() {
        hStackView.axis = .horizontal
        hStackView.alignment = .fill
        hStackView.distribution = .fill
        hStackView.spacing = 10
        hStackView.addArrangedSubviews(symbolLabel,
                                       titleLabel)
        
        titleLabel.setContentHuggingPriority(UILayoutPriority(249), for: .horizontal)
        titleLabel.numberOfLines = 0
    }
    
    private func constrainViews() {
        contentView.addConstrainedSubview(hStackView)
        
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            hStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            hStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
        ])
    }
    
    private func setCellDataWith(_ object: TaskViewModel) {
        symbolLabel.text = object.symbol
        titleLabel.text = object.title
        [symbolLabel, titleLabel].forEach { $0.textColor = object.labelColor }
    }
}
