//
//  BottomBar.swift
//  VK_App
//
//  Created by Антон Онищенко on 06.04.2021.
//

import UIKit

class BottomBar: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var shareCountLabel: UILabel!
    @IBOutlet weak var seenImageView: UIImageView!
    @IBOutlet weak var seenCountLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecpder: NSCoder) {
        super.init(coder: aDecpder)
        commonInit()
        
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("BottomBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .flexibleHeight, .flexibleWidth]
        
    }
    
}
