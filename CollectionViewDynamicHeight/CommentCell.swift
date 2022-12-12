//
//  CommentCell.swift
//  CollectionViewDynamicHeight
//
//  Created by jiwon Yoon on 2022/12/12.
//

import UIKit
import SnapKit

final class CommentCell: UICollectionViewCell {
    static let identifier = "CommentCell"
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 10
        label.textColor = .label
        
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "David Yoon"
        label.numberOfLines = 1
        label.textColor = .systemPurple
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBackground
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        return imageView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 8.0
        [
            messageLabel,
            nameLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10.0)
            $0.leading.equalToSuperview().offset(10.0)
            $0.trailing.equalToSuperview().offset(-10.0)
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10.0)
            $0.bottom.equalToSuperview().offset(-5.0)
            $0.leading.equalToSuperview().offset(10.0)
            $0.trailing.equalToSuperview().offset(-10.0)
        }
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(comment: Comment) {
        imageView.image = UIImage(systemName: comment.ownerPhoto)
        nameLabel.text = comment.owner
        messageLabel.text = comment.message
        
        setupViews()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        
        return layoutAttributes
    }
}

private extension CommentCell {
    func setupViews() {
        [
            imageView,
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5.0)
            $0.leading.equalToSuperview().offset(10.0)
            $0.width.height.equalTo(50.0)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-10.0)
            $0.leading.equalTo(imageView.snp.trailing).offset(10.0)
            $0.trailing.equalToSuperview().offset(-10.0)
        }
    }
}
