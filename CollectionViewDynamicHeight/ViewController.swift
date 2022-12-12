//
//  ViewController.swift
//  CollectionViewDynamicHeight
//
//  Created by jiwon Yoon on 2022/12/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = CommentFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.contentInsetAdjustmentBehavior = .always
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CommentCell.self, forCellWithReuseIdentifier: CommentCell.identifier)
        
        return collectionView
    }()
    
    private var comments: [Comment] = [
        Comment(message: "Hello", owner: "David", ownerPhoto: "lasso.and.sparkles"),
        Comment(message: "Hello\nHello", owner: "David", ownerPhoto: "lasso.and.sparkles"),
        Comment(message: "Hello\nHello\nHello", owner: "David", ownerPhoto: "lasso.and.sparkles"),
        Comment(message: "Hello\nHello\nHello\nHello\nHello", owner: "David", ownerPhoto: "lasso.and.sparkles"),
        Comment(message: "Hello\nHello\nHello\nHello\nHello\nHello", owner: "David", ownerPhoto: "lasso.and.sparkles"),
        Comment(message: "Hello\nHello\nHello\nHello\nHello\nHello\nHello", owner: "David", ownerPhoto: "lasso.and.sparkles")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        setupViews()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return comments.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentCell.identifier, for: indexPath) as? CommentCell else { return UICollectionViewCell() }
        
        let comment = comments[indexPath.item]
        
        cell.setupCell(comment: comment)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}

private extension ViewController {
    func setupViews() {
        [
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
