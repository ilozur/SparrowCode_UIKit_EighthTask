//
//  ViewController.swift
//  SparrowCode_UIKit_EighthTask
//
//  Created by Edmond Podlegaev on 24.04.2024.
//

import UIKit

class ViewController: UIViewController {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.tintColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.frame
        scrollView.contentSize = .init(width: view.frame.width, height: 1000)

        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)

        setupNavigationController()
        setupImageView()
    }

    func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
    }

    func setupImageView() {
        guard let largeTitleClass = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        DispatchQueue.main.async { [self] in
            self.navigationController?.navigationBar.subviews.forEach { subview in
                guard subview.isKind(of: largeTitleClass.self) else { return }
                subview.addSubview(self.imageView)
                NSLayoutConstraint.activate([
                    self.imageView.heightAnchor.constraint(equalToConstant: 36),
                    self.imageView.widthAnchor.constraint(equalToConstant: 36),
                    self.imageView.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: -8),
                    self.imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -16)
                ])
            }
        }
    }
}
