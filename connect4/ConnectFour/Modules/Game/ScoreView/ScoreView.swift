//
//  ScoreView.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import Foundation
import UIKit

class ScoreView: UIView {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var rightImageView: UIImageView!
    @IBOutlet private weak var rightNameLabel: UILabel!
    
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var leftNameLabel: UILabel!
    
    @IBOutlet private weak var leftIndicator: UIView!
    @IBOutlet private weak var rightIndicator: UIView!
    
    // MARK: Properties
    
    private var contentView: UIView?
    
    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftIndicator.layer.cornerRadius = leftIndicator.frame.height / 2
        rightIndicator.layer.cornerRadius = rightIndicator.frame.height / 2
    }
}

private extension ScoreView {
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: ScoreView.reuseIdentifier, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

extension ScoreView {
    func setupUI() {
        scoreLabel.font = Fonts.averta(weight: .semibold, size: 25)
        
        rightNameLabel.font = Fonts.averta(weight: .semibold, size: 20)
        leftNameLabel.font = Fonts.averta(weight: .semibold, size: 20)
    }
    
    func updateUI(model: ScoreViewModel) {
        scoreLabel.text = model.score
        
        leftNameLabel.text = model.leftName
        leftImageView.image = model.leftImage
        
        rightNameLabel.text = model.rightName
        rightImageView.image = model.rightImage
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
            self.leftIndicator.backgroundColor = model.leftIndicatorColor
            self.rightIndicator.backgroundColor = model.rightIndicatorColor
        } completion: { _ in
        }
    }
}
