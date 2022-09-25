//
//  AccountViewController.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import UIKit

class AccountViewController: UIViewController {
    
    private let collectionView: UICollectionView =  Utilities().defaultCollection()
    var settingsItems:[SettingsItem] = [SettingsItem(title: "Notifications", icon: UIImage(systemName: "bell")!),
                                        SettingsItem(title: "Messages", icon: UIImage(systemName: "message")!),
                                        SettingsItem(title: "Profile", icon: UIImage(systemName: "person")!),
                                        SettingsItem(title: "Coupons", icon: UIImage(systemName: "bell")!),
                                        SettingsItem(title: "Location", icon: UIImage(systemName: "location")!)
                                        ]
    
    var headerView:AccountHeaderCollectionReusableView?
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 50.0
    }
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.frame = view.frame
      
      
        collectionView.register(AccountHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AccountHeaderCollectionReusableView.identifier)
        collectionView.register(AccountFooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AccountFooterCollectionReusableView.identifier)
        collectionView.register(AccountCollectionViewCell.self, forCellWithReuseIdentifier: AccountCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    

}


extension AccountViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        settingsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCollectionViewCell.identifier, for: indexPath) as? AccountCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = settingsItems[indexPath.row]
        cell.setup(item: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            headerView = (collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AccountHeaderCollectionReusableView.identifier, for: indexPath) as! AccountHeaderCollectionReusableView)
            
            headerView!.delegate = self
         
            return headerView!
            
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AccountFooterCollectionReusableView.identifier, for: indexPath) as! AccountFooterCollectionReusableView
            footer.delegate = self
            return footer
        default:
            assert(false, "Unexpected element kind")
        }
    }
}

extension AccountViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width) - 32
        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 100.0)
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 60.0)
    }
}


extension AccountViewController:AccountFooterDelegate{
    func logout(_ footer: AccountFooterCollectionReusableView) {
        logoutUser()
    }
    
    func logoutUser(){
        ApiManager.shared.accessToken = Constants.EMPTY
        navigationController?.viewControllers.removeAll()
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
    }
}

extension AccountViewController:AccountHeaderDelegate{
    func changeProfileimage(_ view: AccountHeaderCollectionReusableView) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }

}

extension AccountViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
           self.dismiss(animated: true, completion: nil)
        let user = UserModel(username: "Mikail", image: image, email: "mikailkyusuf@gmail.com")
        
        headerView?.userModel = user
        collectionView.reloadData()
       }
}


struct SettingsItem{
    let title:String
    let icon:UIImage
}
