//
//  ExploreViewController.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import UIKit

enum SectionTypes{
    case exclusive
    case bestSelling
    case groceries
    
    var title:String{
        switch self {
        case .exclusive:
            return "Exclusive"
        case .bestSelling:
            return "Best Selling"
        case .groceries:
            return "Groceries"
        }
    }
}
class ExploreViewController: UIViewController {

    private var exclusiveOffer:[Product] = []
    private var bestSelling:[Product] = []
    private var groceries:[Product] = []
    
    
    var sections = [SectionTypes]()
        
    private var collectionView:UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout{sectionIndex,_ -> NSCollectionLayoutSection? in return ExploreViewController.createSectionLayout(section: sectionIndex)})
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                            style: .done, target: self, action: #selector(didTapSettings))
      
    }
    @objc func didTapSettings(){
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func configureCollectionView(){
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(ProductCollectionViewCell.self,forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.register(HeaderLayoutItem.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderLayoutItem.reuseIdentifier)
        collectionView.dataSource  = self
        collectionView.delegate = self
        
        sections.append(.exclusive)
        sections.append(.bestSelling)
        sections.append(.groceries)
      
    }
    
    private static func createSectionLayout(section:Int)->NSCollectionLayoutSection{
        print("Collection view configured")
        let supplementaryView = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
        ]
        
        switch section{
            
        case 0:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250)), subitem: item,count: 2)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = supplementaryView
            return section
            
        case 1:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250)), subitem: item,count: 2)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = supplementaryView
            return section
        case 2:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(390)), subitem: item,count: 1)
            
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            section.boundarySupplementaryItems = supplementaryView
            return section
            
        default:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0 )))
            
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            //Verical group
            let vericalgroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(390)), subitem: item,count: 1)
            
            
            //section
            let section =  NSCollectionLayoutSection(group: vericalgroup)
            return section
        }
    }
    
}


extension ExploreViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type{
        case .groceries:
            return 10
            
        case .bestSelling:
            return 15
        case .exclusive:
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderLayoutItem.reuseIdentifier, for: indexPath) as? HeaderLayoutItem else{
            return UICollectionReusableView()
        }
        
        let section = indexPath.section
        let title = sections[section].title
        header.setup(headerName: title)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = sections[indexPath.section]
        switch type{
        case .exclusive:
            print("Cell configured for exclusive")
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.setup(product: Product(name: "Apple Pie", imageUrl: "", productPrice: "$123", unitDescription: "Test unit description"))
            return cell
            
        case .bestSelling:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.setup(product: Product(name: "Apple Pie", imageUrl: "", productPrice: "$123", unitDescription: "Test unit description"))
            return cell
        case .groceries:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.setup(product: Product(name: "Apple Pie", imageUrl: "", productPrice: "$123", unitDescription: "Test unit description"))
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
//        return 3
    }
    
    
}
