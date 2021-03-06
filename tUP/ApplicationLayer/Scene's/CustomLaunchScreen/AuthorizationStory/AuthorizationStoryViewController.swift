//
//  AuthorizationStoryViewController.swift
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
import Firebase

protocol AuthorizationStoryDisplayLogic: class {
    func displayLoadedContent(request: AuthorizationStory.Photo.ViewModel)
}

class AuthorizationStoryViewController: UIViewController, AuthorizationStoryDisplayLogic {

    var interactor: AuthorizationStoryBusinessLogic?
    var router: (NSObjectProtocol & AuthorizationStoryRoutingLogic & AuthorizationStoryDataPassing)?
  
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var navigationViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var backGroundImageView: UIImageView!
    @IBOutlet weak var loginItemsStackView: UIStackView!
    @IBOutlet weak var appNameLabel: UILabel!

    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
      
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
  
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = AuthorizationStoryInteractor()
        let presenter = AuthorizationStoryPresenter()
        let router = AuthorizationStoryRouter()
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationViewTrailingConstraint.constant = 15
        
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.loginItemsStackView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.backGroundImageView.alpha = 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LaunchManager.setUserAuthorizationStage(to: .yes)
        
        setupUI()
    }
    
    func displayLoadedContent(request: AuthorizationStory.Photo.ViewModel) {
        backGroundImageView.image = request.photo
    }
}

private extension AuthorizationStoryViewController {
    
    func setupUI() {
        
        let request = AuthorizationStory.Photo.Request()
        interactor?.loadContent(request: request)
        addMoution()
        navigationController?.setNavigationBarHidden(true, animated: false)
        backGroundImageView.alpha = 0
        loginItemsStackView.alpha = 0
        
//        let gradientMaskLayer = CAGradientLayer()
//        gradientMaskLayer.frame = navigationView.bounds
//        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
//        gradientMaskLayer.locations = [0, 0.1, 0.9, 1]
//        
//        navigationView.layer.mask = gradientMaskLayer
//        maskedView.layer.mask = gradientMaskLayer
//        view.addSubview(maskedView)
        
    }
    
    func addMoution() {
        
        let min = CGFloat(-5)
        let max = CGFloat(5)
        let motionEffectGroup = UIMotionEffectGroup()
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)

        
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
              
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
              
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        backGroundImageView.addMotionEffect(motionEffectGroup)
        
        xMotion.minimumRelativeValue = max
        xMotion.maximumRelativeValue = min
        
        yMotion.minimumRelativeValue = max
        yMotion.maximumRelativeValue = min
        
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        appNameLabel.addMotionEffect(motionEffectGroup)
    }
}

//Action's
private extension AuthorizationStoryViewController {
    
    @IBAction func tUPAction(_ sender: Any) {
        

        //var docRef =
        //FirestoreManager.shared.addSomeData()
        //FirestoreManager.shared.addSomeData()
        AuntificationManager.createUserWith(email: "aaaa@aaa.aaa", password: "112233")//signInWith(email: "aaaa@aaa.aaa", password: "1234568")
        
    }
}
