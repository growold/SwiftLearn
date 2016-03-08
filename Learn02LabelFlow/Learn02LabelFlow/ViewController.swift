//
//  ViewController.swift
//  Learn02LabelFlow
//
//  Created by Liu Wei on 16/3/8.
//  Copyright © 2016年 Liu Wei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource = [String]()
    var labels = [TagLabel]()
    
    let count = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 0..<count {
            dataSource.append(RandomString.sharedInstance.getRandomStringOfLength(3 + Int(arc4random_uniform(7))))
        }
        
        for i in 0..<count {
            labels.append(TagLabel())
            labels[i].text = dataSource[i]
            labels[i].padding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            labels[i].layer.borderColor = UIColor.greenColor().CGColor
            labels[i].layer.borderWidth = 1
            labels[i].layer.cornerRadius = 8
            
            self.view.addSubview(labels[i])
        }
        
        layoutLabels()
    }
    
    func layoutLabels() {
        
        let width = UIScreen.mainScreen().bounds.width
        //标签间水平间距
        let horizontalSpace : CGFloat = 12
        //标签行间距
        let verticalSpace : CGFloat = 12
        //左边已经填充长度
        var left : CGFloat = 0
        //顶部已经填充高度
        var top : CGFloat = 0
        
        var lineLabels = [[TagLabel]]()
        var lineLabel = [TagLabel]()
        var lineStartSpace = [CGFloat]()
        for label in labels {
            let labelWidth = label.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).width
            if left + labelWidth + horizontalSpace > width {
                lineLabels.append(lineLabel)
                lineLabel = [TagLabel]()
                lineStartSpace.append((width - left + horizontalSpace) / 2)
                left = 0
            }
            
            left += labelWidth + horizontalSpace
            lineLabel.append(label)
        }
        
        lineLabels.append(lineLabel)
        lineStartSpace.append((width - left + horizontalSpace) / 2)

        top = verticalSpace + 20
        var size : CGSize = CGSize.zero
        for (index, oneLine) in lineLabels.enumerate() {
            left = lineStartSpace[index]
            for label in oneLine {
                size = label.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                label.frame = CGRect(x: left, y: top, width: size.width, height: size.height)
                left += size.width + horizontalSpace
                
            }
            top += size.height + verticalSpace
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

