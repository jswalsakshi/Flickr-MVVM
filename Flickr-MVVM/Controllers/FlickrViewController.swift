//
//  FlickrViewController.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 20/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit
import SDWebImage

struct Product {
    
}

protocol RecentViewControllerDelegate: class {
    func naviagteToNextPage(_ controller: RecentViewController, didTapProduct product: Product)
}

class RecentViewController: UICollectionViewController, Storyboarded {
    
    weak var delegate: RecentViewControllerDelegate?
    
    // MARK: - Properties
    
    let viewModel: FlickrCollectionViewModel!
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    
    // MARK: - Lifecycle
    
    init(withViewModel: FlickrCollectionViewModel) {
        viewModel = withViewModel
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Recent"
        configureNavigationBar()
        configureCollectionView()
    }
    
    private func configureNavigationBar() {
//         navigationItem.title = viewModel.navigationTitle
    }
    
    private func configureCollectionView() {
        guard let collectionView = collectionView else {
            fatalError("collectionView could not be found")
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(FlickrCollectionCell.self, forCellWithReuseIdentifier: viewModel.reuseIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.requestNextPhotosPage(completion: updateCollectionView)
    }
    
    // MARK: - Lazy Loading
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let itemsPerPage = viewModel.itemsPerPage
        let itemsPerSection = viewModel.itemsPerSection
        let itemsTreshold = viewModel.itemsTreshold
        
        let currentItem = indexPath.row + (indexPath.section * itemsPerSection)
        let treshHoldItem = (viewModel.currentPage * itemsPerPage) - itemsTreshold
        
        if (currentItem > treshHoldItem) && (viewModel.currentPage < viewModel.totalPages) {
            viewModel.requestNextPhotosPage(completion: updateCollectionView)
        }
    }
    
    private func updateCollectionView() {
        DispatchQueue.main.async{
            guard let collectionView = self.collectionView else {
                fatalError("self.collectionView could not be found")
            }
            
            if collectionView.numberOfSections == 0 {
                collectionView.reloadData()
            } else {
                let numberOfSections = collectionView.numberOfSections
                let lastIndexOfNewSections = numberOfSections + 2
                let indexSet = IndexSet(integersIn: numberOfSections...lastIndexOfNewSections)
                
                collectionView.insertSections(indexSet)
            }
        }
    }
    
    // MARK: - Simple Fullscreen Image
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! FlickrCollectionCell
        let imageView = selectedCell.imageView
        
        showFullscreenImage(image: imageView.image!)
    }
    
    private func showFullscreenImage(image: UIImage) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(RecentViewController.dismissFullscreenImage))
        let imageView = UIImageView(image: image)
        
        imageView.frame = UIScreen.main.bounds
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
        
        view.addSubview(imageView)
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    
    @objc
    fileprivate func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        
        sender.view?.removeFromSuperview()
    }
    
}

// MARK: - UICollectionViewDataSource

extension RecentViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.photosData.count / viewModel.itemsPerSection
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemsPerSection
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reuseIdentifier, for: indexPath) as! FlickrCollectionCell
        
        let index = indexPath.row + (indexPath.section * viewModel.itemsPerSection)
        let imageURL = viewModel.photosData[index].imageURL()
        
        cell.imageView.image = nil
        
        cell.imageView.sd_setImage(with: URL(string: imageURL)!, placeholderImage: nil)

        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension RecentViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow = CGFloat(viewModel.itemsPerRow)
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
