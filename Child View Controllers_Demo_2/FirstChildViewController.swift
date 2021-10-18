//
//  FirstChildViewController.swift
//  Child View Controllers_Demo_2
//
//  Created by 준수김 on 2021/10/18.
//

import UIKit

class FirstChildViewController: UIViewController {
    
    private var collctionView: UICollectionView?
    private var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: view.frame.size.height, height: view.frame.size.height) //꽉찬 화면
        layout.itemSize = CGSize(width: 150 , height: 150)
        
        collctionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collctionView?.delegate = self
        collctionView?.dataSource = self
        collctionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collctionView!)
        //스크롤 바 없애는 코드
        collctionView?.showsHorizontalScrollIndicator = false
        collctionView?.showsVerticalScrollIndicator = false
        view.backgroundColor = .red
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collctionView?.frame = view.bounds
    }

}

extension FirstChildViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
    
}
