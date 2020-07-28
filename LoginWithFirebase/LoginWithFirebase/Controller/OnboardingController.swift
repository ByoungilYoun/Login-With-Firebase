//
//  OnboardingController.swift
//  LoginWithFirebase
//
//  Created by 윤병일 on 2020/07/29.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import Foundation
import paper_onboarding

class OnboardingController : UIViewController {
    
  //MARK: - Properties
  
  private var onboardingItems = [OnboardingItemInfo]()
  private var onboardingView = PaperOnboarding()
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    configureOnboardingDataSource()
    
  }
  
  //MARK: - Helpers
  func configureUI() {
    view.addSubview(onboardingView)
    onboardingView.fillSuperview()
  }
  
  func configureOnboardingDataSource() {
    let item1 = OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "baseline_insert_chart_white_48pt").withRenderingMode(.alwaysOriginal), title: "Metrics", description: "Some description here ..", pageIcon: UIImage(), color: .systemPurple, titleColor: .white, descriptionColor: .white, titleFont: UIFont.boldSystemFont(ofSize: 24), descriptionFont: UIFont.systemFont(ofSize: 16))
    
    
    onboardingItems.append(item1)
    onboardingItems.append(item1)
    onboardingItems.append(item1)
    
    onboardingView.dataSource = self
    onboardingView.reloadInputViews()
  }
}

//MARK: - PaperOnboardingDataSource

extension OnboardingController : PaperOnboardingDataSource {
  func onboardingItemsCount() -> Int {
    return onboardingItems.count
  }
  
  func onboardingItem(at index: Int) -> OnboardingItemInfo {
    return onboardingItems[index]
  }
  
  
}
