//
//  UIView+addFillet.h
//  FZHWorkKitDemo
//
//  Created by 冯志浩 on 2018/3/1.
//  Copyright © 2018年 冯志浩. All rights reserved.
//  给view添加圆角


#import <UIKit/UIKit.h>
@interface UIView (addFillet)
/**
 给UIView切圆角

 @param corners 圆角的位置
 @param radius 圆角的半径
 */
- (void)setupViewFilletWithRectCorner:(UIRectCorner)corners radius:(CGFloat)radius;
@end
