//
//  HomeCell.swift
//  YoutubeClone
//
//  Created by minhdtn on 21/08/2022.
//

import UIKit
class HomeCell: UICollectionViewCell {
    //MARK: Params
    var video: Video? {
        didSet {
            setupView()
        }
    }
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 46/2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let separatorView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return uiView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .lightGray
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.isEditable = false
        return textView
    }()
    //MARK: Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Helpers
    func configureUI() {
        addSubview(thumbnailImageView)
        thumbnailImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, height: 220)
        addSubview(userProfileImageView)
        userProfileImageView.anchor(top: thumbnailImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 36, width: 46)
        addSubview(separatorView)
        separatorView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        separatorView.setHeight(1)
        addSubview(titleLabel)
        titleLabel.anchor(top: thumbnailImageView.bottomAnchor, left: userProfileImageView.rightAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingRight: 16, height: 44)
        addSubview(subtitleTextView)
        subtitleTextView.anchor(top: titleLabel.bottomAnchor, left: userProfileImageView.rightAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 8,paddingRight: 16, height: 30)
        
    }
    func setupView() {
        guard let video = video else {
            return
        }
        titleLabel.text = video.title
        titleLabel.setHeight(getTitleLabelHeight())
        
        subtitleTextView.text = "\(video.chanel!.name!) • \(video.formattedNumberOfViews()) • 2 years"
        
        guard let thumbnailImageURL = video.thumbnailImageName else { return }
        thumbnailImageView.setupImage(withURL: thumbnailImageURL)
        
        guard let userImageURL = video.chanel?.profileImageName else { return }
        userProfileImageView.setupImage(withURL: userImageURL)
    }
    func getTitleLabelHeight() -> CGFloat{
        if let title = titleLabel.text {
            let size = CGSize(width: frame.width - 16 - 8 - 46 - 16 - 50, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimateRect = NSString(string: title)
                .boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
            if estimateRect.height > 20 {
                return 44
            } else {
                return 20
            }
        }
        return 20
    }
}
