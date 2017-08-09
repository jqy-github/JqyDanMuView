//
//  JqyDanMuView.h
//  DanMu_MySelf
//
//  Created by 开发者 on 17/4/20.
//  Copyright © 2017年 J丶Qy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+CGRect.h"

@protocol JqyDanMuViewDelegate <NSObject>

/*
 * 最后一条弹幕走出屏幕
 */

- (void)lastDanMuThrough;

/*
 * 弹幕完全结束后回调方法
 */
- (void)endDanMu;





@end

@interface JqyDanMuView : UIView

/*
 * 声明代理
 */

@property (nonatomic,weak)id<JqyDanMuViewDelegate>delegate;

/*
 * 弹幕数组
 */
@property (nonatomic,strong)NSMutableArray *danMuArray;

/*
 * 设置弹幕字体大小 默认15号
 */
@property (nonatomic,assign)CGFloat danMuFont;

/*
 * 设置弹幕速度 (多少秒走完弹幕屏宽) 默认5秒
 */
@property (nonatomic,assign)CGFloat throughTime;


/*
 * 设置弹幕行数
 */

@property (nonatomic,assign)NSInteger lineNumber;

/*
 * 设置每行弹幕高度 默认25
 */
@property (nonatomic,assign)CGFloat rowHeight;

/*
 * 设置弹幕纵向间隔 默认5
 */
@property (nonatomic,assign)CGFloat verticalSpace;

/*
 * 设置弹幕横向间隔 默认 60
 */
@property (nonatomic,assign)CGFloat horizontalSpace;

/*
 * 设置弹幕 字体颜色 默认黑色
 */

@property (nonatomic,strong)UIColor *danMuTexCorlor;

/*
 * 即将出现的下个弹幕的坐标
 */
@property (nonatomic,assign)NSInteger nextDanMuIndex;

/*
 * 限制弹幕最大宽度 默认弹幕屏宽的0.5
 */
@property (nonatomic,assign)CGFloat maxDanMuWidth;

/*
 * 每行弹幕之间是否匀速 默认否
 */
@property (nonatomic,assign)BOOL isUniformSpeed;

/*
 * 弹幕装完后是否删除数组里的弹幕 默认YES
 */
@property (nonatomic,assign)BOOL isRemoveDanMuArray;


/*
 * 开始发射弹幕
 */
- (void)startSendDanMuRightDistance:(CGFloat)distance;

/*
 * 获取屏幕上现实的弹幕
 */
- (NSArray *)getDanMuLabels;

/*
 * 发射弹幕
 */

@property (nonatomic,strong)id handSendDanMuData; //手动发射的弹幕





@end





