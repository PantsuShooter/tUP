//
//  HomePresenter.swift
//  tUP
//
//  Created by Home on 07.03.2020.
//  Copyright (c) 2020 Home. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic
{
  func presentSomething(response: Home.Something.Response)
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Home.Something.Response)
  {
    let viewModel = Home.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}