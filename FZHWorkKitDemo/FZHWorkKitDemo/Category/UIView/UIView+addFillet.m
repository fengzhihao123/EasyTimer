//
//  UIView+addFillet.m
//  FZHWorkKitDemo
//
//  Created by 冯志浩 on 2018/3/1.
//  Copyright © 2018年 冯志浩. All rights reserved.
//

#import "UIView+addFillet.h"

@implementation UIView (addFillet)
- (void)setupViewFilletWithRectCorner:(UIRectCorner)corners radius:(CGFloat)radius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
@end
