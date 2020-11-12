//
//  RegionAddPresenter.swift
//  WriteMe
//
//  Created by Vladimir on 13.11.2020.
//  Copyright (c) 2020 Vladimir Mikhaylov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RegionAddPresentationLogic
{
  func presentSomething(response: RegionAdd.Something.Response)
}

class RegionAddPresenter: RegionAddPresentationLogic
{
  weak var viewController: RegionAddDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: RegionAdd.Something.Response)
  {
    let viewModel = RegionAdd.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
