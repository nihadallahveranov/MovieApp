//
//  DetailSegmentControlTableViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 18.03.23.
//

import UIKit
import YoutubePlayer_in_WKWebView

class DetailSegmentControlTableViewCell: UITableViewCell {

    private lazy var detailSegmentControler: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["About Movie",
                                                        "Trailer",
                                                        "Cast"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.backgroundColor = UIColor(named: "secondaryColor")
        segmentControl.selectedSegmentTintColor = UIColor(named: "primaryColor")
        segmentControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        self.contentView.addSubview(segmentControl)
        return segmentControl
    }()
    
    private lazy var detailLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences."
        label.font = label.customFont(14)
        label.numberOfLines = 0
        
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var webView: WKYTPlayerView = {
        let view = WKYTPlayerView()
//        view.layer.cornerRadius = 18
//        view.clipsToBounds = true
        
        self.contentView.addSubview(view)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        switch selectedIndex {
        case 0:
            print("Option 1 selected")
            detailLabel.isHidden = false
            webView.stopVideo()
            webView.isHidden = true
        case 1:
            detailLabel.isHidden = true
            if let videoId = DetailViewModel.shared.youtubeTrailer?.videoId {
                print("success")
                DispatchQueue.main.async {
                    self.webView.load(withVideoId: videoId)
                }
            }
        default:
            break
        }
    }
    
    func setupViews() {
        
        self.contentView.backgroundColor = UIColor(named: "primaryColor")
        self.webView.isHidden = true
        self.webView.delegate = self
        
        detailSegmentControler.snp.makeConstraints() { make in
            make.top.equalTo(self.contentView.snp.top).offset(16)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        detailLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.detailSegmentControler.snp.bottom).offset(32)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
        }
        
        webView.snp.makeConstraints() { make in
            make.top.equalTo(self.detailSegmentControler.snp.bottom).offset(32)
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.height.equalTo(300)
        }
    }
    
    func configure(item: Movie?) {
        guard let item = item else { return }
        detailLabel.text = item.summary!
    }

}

extension DetailSegmentControlTableViewCell: WKYTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        webView.isHidden = false
        webView.playVideo()
    }
}
