//
//  UIView+CGRect.h
//  YiBuZhiCheng
//
//  Created by J～Qy on 16/8/10.
//  Copyright © 2016年 J丶Qy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define K_Width [UIScreen mainScreen].bounds.size.width //屏幕宽

#define K_Height [UIScreen mainScreen].bounds.size.height //屏幕高

@interface UIView (CGRect)

@property(nonatomic)CGFloat x;
@property(nonatomic)CGFloat y;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGFloat width;

- (UIViewController *)getCurrentWindowVC;

- (UIViewController *)getCurrentUIVC;

@end
