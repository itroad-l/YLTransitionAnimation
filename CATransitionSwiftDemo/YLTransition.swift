//
//  YLTransition.swift
//  CATransitionSwiftDemo
//
//  Created by xyl on 16/7/27.
//  Copyright © 2016年 xyl. All rights reserved.
//

import UIKit

enum TransitionType: Int {
    case    Fade = 1,                   //淡入淡出
            Push,                       //推挤
            Reveal,                     //揭开
            MoveIn,                     //覆盖
            Cube,                       //立方体
            SuckEffect,                 //吮吸
            OglFlip,                    //翻转
            RippleEffect,               //波纹
            PageCurl,                   //翻页
            PageUnCurl,                 //反翻页
            CameraIrisHollowOpen,       //开镜头
            CameraIrisHollowClose,      //关镜头
            CurlDown,                   //下翻页
            CurlUp,                     //上翻页
            FlipFromLeft,               //左翻转
            FlipFromRight               //右翻转
}

class YLTransition: CATransition {
    
    var _superView: UIView?
    
    var _subtype = 0
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func transitionAnimation(transitionType: TransitionType,view: UIView){
        _superView = view
        
        let transitionType = TransitionType(rawValue: transitionType.rawValue)!
        
        var subTypeString:String?
        
        switch(_subtype){
            
        case 0:
            subTypeString = kCATransitionFromLeft
        case 1:
            subTypeString = kCATransitionFromBottom
        case 2:
            subTypeString = kCATransitionFromRight
        case 3:
            subTypeString = kCATransitionFromTop
        default:
            subTypeString = kCATransitionFromLeft
            
        }
        
        _subtype += 1
        
        if(_subtype > 3){
            
            _subtype = 0
        }
        
        switch(transitionType){
        case .Fade:
            transitionWithType(kCATransitionFade, withSubType: subTypeString!, forView: _superView!)
        case .Push:
            transitionWithType(kCATransitionPush, withSubType: subTypeString!, forView: _superView!)
        case .Reveal:
            transitionWithType(kCATransitionReveal, withSubType: subTypeString!, forView: _superView!)
        case .MoveIn:
            transitionWithType(kCATransitionMoveIn, withSubType: subTypeString!, forView: _superView!)
        case .Cube:
            transitionWithType("cube", withSubType: subTypeString!, forView: _superView!)
        case .SuckEffect:
            transitionWithType("suckEffect", withSubType: subTypeString!, forView: _superView!)
        case .OglFlip:
            transitionWithType("oglFlip", withSubType: subTypeString!, forView: _superView!)
        case .RippleEffect:
            transitionWithType("rippleEffect", withSubType: subTypeString!, forView: _superView!)
        case .PageCurl:
            transitionWithType("pageCurl", withSubType: subTypeString!, forView: _superView!)
        case .PageUnCurl:
            transitionWithType("pageUnCurl", withSubType: subTypeString!, forView: _superView!)
        case .CameraIrisHollowOpen:
            transitionWithType("cameraIrisHollowOpen", withSubType: subTypeString!, forView: _superView!)
        case .CameraIrisHollowClose:
            transitionWithType("cameraIrisHollowClose", withSubType: subTypeString!, forView: _superView!)
        default: break
        }
    }
    
    
    func viewAnimation(transitionType: TransitionType,view: UIView){
        
        
        let transitionType = TransitionType(rawValue: transitionType.rawValue)!

        switch transitionType {
        case .CurlDown:
            animationWithView(view, withAnimationTransition: UIViewAnimationTransition.CurlDown)
        case .CurlUp:
            animationWithView(view, withAnimationTransition: UIViewAnimationTransition.CurlUp)
        case .FlipFromLeft:
            animationWithView(view, withAnimationTransition: UIViewAnimationTransition.FlipFromLeft)
        case .FlipFromRight:
            animationWithView(view, withAnimationTransition: UIViewAnimationTransition.FlipFromRight)
        default:
            break
        }
    }
    
    // MARK: CATransition动画实现
    private func transitionWithType(type:String,withSubType subType:String,forView view:UIView){
        
        //创建CATransition对象
        let animation = CATransition()
        
        //设置运动时间
        animation.duration = 1
        
        //设置运动type
        animation.type = type;
        
        if (!subType.isEmpty) {
            
            //设置子类
            animation.subtype = subType;
        }
        
        //设置运动速度
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        view.layer.addAnimation(animation, forKey: "animation")
    }


    // MARK: UIView实现动画
    private func animationWithView(view:UIView,withAnimationTransition transition:UIViewAnimationTransition){
        
        UIView.animateWithDuration(1, animations: {
            
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
            UIView.setAnimationTransition(transition, forView: view, cache: true)
            
        })
    }
}
