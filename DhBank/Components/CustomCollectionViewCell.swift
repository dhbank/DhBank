//
//  CustomCollectionViewCell.swift
//  DhBank
//
//  Created by Diego Honório on 05/01/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = CustomCollectionViewCell.self.description()
    
    public let labelCurrent: UILabel = {
        let value = UILabel()
        value.text = "Moeda"
        value.translatesAutoresizingMaskIntoConstraints = false
        value.textAlignment = .center
        value.textColor = .black
        return value
    }()
    public let valueCurrent: UILabel = {
        let value = UILabel()
        value.text = "Valor"
        value.translatesAutoresizingMaskIntoConstraints = false
        value.textAlignment = .center
        value.textColor = .black
        return value
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.layer.backgroundColor = UIColor.white.cgColor
        contentView.addSubview(labelCurrent)
        contentView.addSubview(valueCurrent)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        labelCurrent.frame = CGRect(x: 5, y: 20, width:  contentView.frame.size.width-10, height: 50)
        valueCurrent.frame = CGRect(x: 5, y: contentView.frame.size.width-60, width: contentView.frame.size.width-10, height: 50)

    }
    
    public func configure(titleCurrent: String, titleValue: String){
        
        labelCurrent.text = titleCurrent
        valueCurrent.text = titleValue
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelCurrent.text = nil
    }
    
}
