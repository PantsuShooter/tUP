//
//  ImitationLaunchScreenViewController.swift
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
import SwiftMessages
import AnimatedGradientView

protocol ImitationLaunchScreenDisplayLogic: class {
    func displayPhotoInfo(viewModel: ImitationLaunchScreen.PhotoInfo.ViewModel)
    func displayErrorInfo(viewModel: ImitationLaunchScreen.PhotoInfo.ViewModel)
    
    func displayPhoto(viewModel: ImitationLaunchScreen.PhotoPreview.ViewModel)
    func displayPhotoError(viewModel: ImitationLaunchScreen.PhotoPreview.ViewModel)
    
    func displayPhotoToSet(viewModel: ImitationLaunchScreen.PhotoToSet.ViewModel)
}

class ImitationLaunchScreenViewController: UIViewController, ImitationLaunchScreenDisplayLogic {
    
    var interactor: ImitationLaunchScreenBusinessLogic?
    var router: (NSObjectProtocol & ImitationLaunchScreenRoutingLogic & ImitationLaunchScreenDataPassing)?

    @IBOutlet var backgroundView: AnimatedGradientView!
 
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
        
    // MARK: Setup
    private func setup() {
        
        let viewController = self
        let interactor = ImitationLaunchScreenInteractor()
        let presenter = ImitationLaunchScreenPresenter()
        let router = ImitationLaunchScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        redirectDependOnAuthorizationStage()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - ViewModel
    func displayPhotoInfo(viewModel: ImitationLaunchScreen.PhotoInfo.ViewModel) {
      
        if let photoUrl = viewModel.photoUrl {
            let request = ImitationLaunchScreen.PhotoPreview.Request(imageLink: photoUrl)
            interactor?.loadPhoto(request: request)
        }
    }
    
    func displayErrorInfo(viewModel: ImitationLaunchScreen.PhotoInfo.ViewModel) {
        
        if let error = viewModel.error {
            showError(message: error.localizedDescription)
        }
        
        guard let image = R.image.authorizationStoryNoImagePlaceholder() else { return }
        let request = ImitationLaunchScreen.PhotoToSet.Request(photo: image)
        interactor?.setPhoto(reques: request)
    }
    
    func displayPhoto(viewModel: ImitationLaunchScreen.PhotoPreview.ViewModel) {
        
        guard let image = viewModel.photo else { return }
        let request = ImitationLaunchScreen.PhotoToSet.Request(photo: image)
        interactor?.setPhoto(reques: request)
    }
    
    func displayPhotoError(viewModel: ImitationLaunchScreen.PhotoPreview.ViewModel) {
        
        if let error = viewModel.error {
            showError(message: error.localizedDescription)
        }
        
        guard let image = R.image.authorizationStoryNoImagePlaceholder() else { return }
        let request = ImitationLaunchScreen.PhotoToSet.Request(photo: image)
        interactor?.setPhoto(reques: request)
    }
    
    func displayPhotoToSet(viewModel: ImitationLaunchScreen.PhotoToSet.ViewModel) {
        
        performSegue(withIdentifier: R.segue.imitationLaunchScreenViewController.authorizationStory, sender: nil)
    }
}


//MARK: - Setup
extension ImitationLaunchScreenViewController {
    
    private func setupUI() {
        setupNavigationBar()
        setupBackgroundView()
    }
    
    private func setupNavigationBar() {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupBackgroundView() {
        
        backgroundView.direction = .up
        backgroundView.animationValues = [(colors: ["#FFFFFF"], .up, .axial),
                                          (colors: ["#8E44AD", "#FFFFFF"], .up, .axial),
                                          (colors: ["#FFFFFF", "#76D7C4"], .up, .axial)]
    }
}


//MARK: - Private
extension ImitationLaunchScreenViewController {
    
    private func redirectDependOnAuthorizationStage() {
        
        switch LaunchManager.hasUserGoThroughAuthorizationStage() {
        case .no:
            let request = ImitationLaunchScreen.PhotoInfo.Request()
            interactor?.getRandomPhoto(request: request)
        case .yes:
            router?.navigateToHome()
        }
    }
    
    private func showError(message: String) {
        AlertsManager.showStatusBarErrorMessageWith(text: message)
    }
}

