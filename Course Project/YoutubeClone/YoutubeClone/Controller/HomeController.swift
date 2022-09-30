//
//  ViewController.swift
//  YoutubeClone
//
//  Created by minhdtn on 21/08/2022.
//

import UIKit

class HomeController: UICollectionViewController {

    //MARK: Properties
    private var videos = [Video]()
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "youtube-1")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchVideos()
        configureUI()
    }
    //MARK: Helpers
    func fetchVideos() {
        VideoManager.performRequest(with: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json") { videos in
            DispatchQueue.main.async {
                self.videos = videos
                self.collectionView.reloadData()
            }
        }
    }
    func configureUI() {
        //configureNavigationBar
        navigationController?.navigationBar.isTranslucent = false
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 32/255, alpha: 1)
//        navigationController?.navigationBar.standardAppearance = appearance;
//        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        navigationController?.navigationBar.addSubview(logoImageView)
        logoImageView.anchor(left: navigationController?.navigationBar.leftAnchor, bottom: navigationController?.navigationBar.bottomAnchor, paddingLeft: 20, paddingBottom: -15, width: 85 , height: 75)
        let searchItem = UIBarButtonItem(image: UIImage(named: "search_selected"), style: .plain, target: self, action: #selector(didTapSearch))
        let moreItem = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(didTapMore))
        navigationItem.rightBarButtonItems = [moreItem,searchItem]
        collectionView.backgroundColor = .white
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: "cellID")
    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
      }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
      }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! HomeCell
        cell.video = videos[indexPath.row]
        return cell
    }
    //MARK: Actions
    @objc func didTapSearch() {
        print("searching...")
    }
    @objc func didTapMore() {
        print("Moreeeeeee")
    }
}
    //MARK: UICollectionViewDelegateFlowLayout
extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heightThumbnail = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: heightThumbnail + 16 + 16 + 44 + 8 + 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
