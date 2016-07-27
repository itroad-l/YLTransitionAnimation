//
//  ViewController.swift
//  CATransitionSwiftDemo
//
//  Created by xyl on 16/7/27.
//  Copyright © 2016年 xyl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let image1 = "bg-1"
    let image2 = "bg-2"
    
    let kScreenWidth = UIScreen.mainScreen().bounds.width
    
    let kScreenHeight = UIScreen.mainScreen().bounds.height
    
    var _imageType = 0
    
    var _imageView: UIImageView?
    
    var _tran: YLTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _imageView = UIImageView.init(frame: self.view.frame)
        _imageView?.backgroundColor = UIColor.greenColor()
        _imageView?.image = UIImage.init(named: image1)
        view.addSubview(_imageView!)
        
        let titArr = ["淡入淡出","推挤","揭开","覆盖","立方体","吮吸","翻转","波纹","翻页","反翻页","开镜头","关镜头","下翻页","上翻页","左翻转","右翻转"]
        
        var i = 0
        
        var j = 0
        
        var z = 0
        
        for str in titArr {
            
            if i == 2 {
                i = 0
                j = j + 1
            }
            
            var btn: UIButton?
            
            btn = UIButton.init(frame: CGRectMake((kScreenWidth - 200)/3 + (100 + (kScreenWidth - 200)/3) * CGFloat(i), (kScreenHeight - 30 * 8)/9 + (30 + (kScreenHeight - 30 * 8)/9) * CGFloat(j), 100, 30))
            
            
            btn!.backgroundColor = UIColor.greenColor()
            btn!.setTitleColor(UIColor.blackColor(), forState: .Normal)
            btn!.alpha = 0.5
            btn!.tag = 101 + z
            btn!.setTitle(str, forState: .Normal)
            btn!.addTarget(self, action: #selector(ViewController.btnClick(_:)), forControlEvents: .TouchUpInside)
            view.addSubview(btn!)
            
            i = i + 1
            z = z + 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func btnClick(btn: UIButton){
        switch btn.tag {
        case 101:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.Fade, view: _imageView!)
        case 102:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.Push, view: _imageView!)
        case 103:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.Reveal, view: _imageView!)
        case 104:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.MoveIn, view: _imageView!)
        case 105:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.Cube, view: _imageView!)
        case 106:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.SuckEffect, view: _imageView!)
        case 107:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.OglFlip, view: _imageView!)
        case 108:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.RippleEffect, view: _imageView!)
        case 109:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.PageCurl, view: _imageView!)
        case 110:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.PageUnCurl, view: _imageView!)
        case 111:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.CameraIrisHollowOpen, view: _imageView!)
        case 112:
            _tran = YLTransition.init()
            _tran?.transitionAnimation(TransitionType.CameraIrisHollowClose, view: _imageView!)
        case 113:
            _tran = YLTransition.init()
            _tran?.viewAnimation(TransitionType.CurlDown, view: _imageView!)
        case 114:
            _tran = YLTransition.init()
            _tran?.viewAnimation(TransitionType.CurlUp, view: _imageView!)
        case 115:
            _tran = YLTransition.init()
            _tran?.viewAnimation(TransitionType.FlipFromLeft, view: _imageView!)
        case 116:
            _tran = YLTransition.init()
            _tran?.viewAnimation(TransitionType.FlipFromRight, view: _imageView!)
        default:
            break
        }
        bgChange()
    }
    
    func bgChange(){
        if _imageType == 0 {
            _imageType = 1
            _imageView?.image = UIImage.init(named: image2)
        }else{
            _imageType = 0
            _imageView?.image = UIImage.init(named: image1)
        }
    }
}

