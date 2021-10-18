//
//  ViewController.swift
//  Child View Controllers_Demo_2
//
//  Created by 준수김 on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var firstChildVC = FirstChildViewController()
    private lazy var secondChildVC = SecondChildViewController()
    //lazy var: 처음 사용되기 전까지 연산되지 않다가 사용되는 순간 연산되는 변수
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVCs()
    }
    
   
    
    private func addChildVCs() {
        addChild(firstChildVC)
        addChild(secondChildVC)
        //addChild: 해당 ViewController 내에 자식 ViewController를 추가해서 사용할 때 이용하는 메서드
        //즉, ViewController에 FirstChildViewController/SecondChildViewController를 자식으로 추가
        
        view.addSubview(firstChildVC.view)
        view.addSubview(secondChildVC.view)
        //ViewController의 View에 firstChildVC.view, secondChildVC.view 추가한다.
        
        //addChild VS addSubview: 전자는 각각의 ViewController에서 자신을 소유하고 있는 View에서 event를 관리한다. 후자는 하나의 ViewController에서 event를 관리한다.
        firstChildVC.view.frame = CGRect(x: 0,
                                         y: 0,
                                         width: view.frame.size.width,
                                         height: view.frame.size.height/3) //스크린의 1/3
        
        secondChildVC.view.frame = CGRect(x: 0,
                                          y: view.frame.size.height/3, //첫번째 자식VC의 끝 부터 시작
                                          width: view.frame.size.width,
                                          height: (view.frame.size.height/3)*2) //스크린의 2/3
        
        
        
        firstChildVC.didMove(toParent: self)
        secondChildVC.didMove(toParent: self)
        //자식ViewController입장에서는 언제 부모ViewController추가 되는지 모르게 때문에 자식VC에 추가 및 제거 되는 시점을 알려주는 것 (willMove, didMove)
    }

}
