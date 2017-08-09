//
//  JqyDanMuView.m
//  DanMu_MySelf
//
//  Created by 开发者 on 17/4/20.
//  Copyright © 2017年 J丶Qy. All rights reserved.
//

#import "JqyDanMuView.h"




@interface JqyDanMuView ()

@property (nonatomic,copy)void(^danMuEndBlock)(CGRect,NSInteger,CGFloat,NSInteger);

@property (nonatomic,strong)NSMutableArray *loadDanmuLineArray; //加载过的弹幕行数

@end

@implementation JqyDanMuView

#pragma mark ---------- 重写初始化方法 -----------

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.clipsToBounds = YES;
        
        /*
         * 设置弹幕字体大小 默认15号
         */
        self.danMuFont = 15;
        
        /*
         * 设置弹幕速度 (多少秒走完弹幕屏宽) 默认5秒
         */
        self.throughTime = 5.f;
        
        
        /*
         * 设置弹幕行数 默认 3
         */
        
        self.lineNumber = 3;
        
        /*
         * 设置每行弹幕高度 默认25
         */
        self.rowHeight = 25;
        
        /*
         * 设置弹幕纵向间隔 默认5
         */
        self.verticalSpace = 5;
        
        /*
         * 设置弹幕横向间隔 默认60
         */
        self.horizontalSpace = 60;

        /*
         * 设置弹幕 字体颜色 默认黑色
         */
        self.danMuTexCorlor = [UIColor blackColor];
        
        
        /*
         * 限制弹幕最大宽度 默认弹幕屏宽的0.5
         */
        self. maxDanMuWidth = frame.size.width*0.5;
        
        /*
         * 每行弹幕之间是否匀速 默认否
         */
        self.isUniformSpeed = NO;

        /*
         * 弹幕装完后是否删除数组里的弹幕 默认YES
         */
       self.isRemoveDanMuArray = YES;

        
    }
    
    return self;
}



#pragma maerk ------- 开始发射弹幕 --------


- (void)startSendDanMuRightDistance:(CGFloat)distance {
    
    __weak JqyDanMuView *weakSelf = self;
    
                            //约束            //弹幕所发文字在数组的下标  //弹幕速度       //弹幕所属行数
    self.danMuEndBlock = ^(CGRect danMuFrame, NSInteger danMuIndex, CGFloat speed, NSInteger lineIndex) {
    
    
        if (weakSelf.danMuArray.count > danMuIndex + self.lineNumber) {
            

            CGFloat nextDanMuIndex = weakSelf.handSendDanMuData ? danMuIndex : danMuIndex + self.lineNumber;
           
            id netxtDanMuData = weakSelf.handSendDanMuData ? weakSelf.handSendDanMuData : weakSelf.danMuArray[danMuIndex + self.lineNumber];
           
            CGFloat fitWidth;
            

            if ([netxtDanMuData isKindOfClass:[NSDictionary class]]) {
                #warning--------- 自定义部分 netxtDanMuData 字典格式 ------------------
                
                fitWidth = [weakSelf fitText:netxtDanMuData[@"text"] WithforFont:weakSelf.danMuFont];
                
            }else if ([netxtDanMuData isKindOfClass:[NSString class]]) {
                
                fitWidth = [weakSelf fitText:netxtDanMuData WithforFont:weakSelf.danMuFont];
            }
            
            
            CGFloat throughTime = weakSelf.isUniformSpeed ? (weakSelf.width + self.horizontalSpace + fitWidth)/speed : weakSelf.throughTime;
            
            [weakSelf sendDanMuWithFrame:CGRectMake(weakSelf.width + self.horizontalSpace, danMuFrame.origin.y, fitWidth, weakSelf.rowHeight)
                    AndDanMuData:netxtDanMuData
                    AndDanMuIndex:nextDanMuIndex
                    AndthroughTime:throughTime
                    AndLineIndex:lineIndex];
            
        }
        
    };
    
    
    
    if (self.handSendDanMuData) {
        
        if (!self.danMuArray) {
            
            self.danMuArray = [NSMutableArray array];
        }
        
        if (self.danMuArray.count == 0) {
            
            [self.danMuArray addObject:self.handSendDanMuData];
            
        }else if(self.danMuArray.count > 0){
        
            [self.danMuArray insertObject:self.handSendDanMuData atIndex:0];
            
        }
    }
   
    
    for (int i = 0; i < self.lineNumber; i++) {
        
        if (i > self.danMuArray.count - 1) {
            
            NSLog(@"弹幕行数不能超过弹幕个数");
            
            return;
        }
        
        if (self.danMuArray[i]) {
            
            
            CGFloat fitWidth;
            
        if ([self.danMuArray[i] isKindOfClass:[NSDictionary class]]) {
 #warning--------- 自定义部分 netxtDanMuData 字典格式 ------------------
             fitWidth = [self fitText:self.danMuArray[i][@"text"] WithforFont:self.danMuFont];
            
        }else if ([self.danMuArray[i] isKindOfClass:[NSString class]]) {
                
            fitWidth = [self fitText:self.danMuArray[i] WithforFont:self.danMuFont];
            
       }
            
            [self sendDanMuWithFrame:CGRectMake(self.width + distance, self.verticalSpace + (self.verticalSpace + self.rowHeight)*i,fitWidth , self.rowHeight)
                        AndDanMuData:self.danMuArray[i]
                       AndDanMuIndex:i
                      AndthroughTime:self.throughTime
                        AndLineIndex:i];
            
        }
        
    }
    
}


- (NSMutableArray *)loadDanmuLineArray {
    
    if (!_loadDanmuLineArray) {
        
        _loadDanmuLineArray = [NSMutableArray array];
    }
    
    return _loadDanmuLineArray;
}

- (void)sendDanMuWithFrame:(CGRect)frame AndDanMuData:(id )danMuData AndDanMuIndex:(NSInteger)index AndthroughTime:(CGFloat)time AndLineIndex:(NSInteger)lineIndex{
    
    self.handSendDanMuData = nil;
    
    
    UILabel *danMuIteam = [[UILabel alloc]initWithFrame:frame];
    
    danMuIteam.tag = 400+index;
    
    danMuIteam.font = [UIFont systemFontOfSize:self.danMuFont];
    
   if ([danMuData isKindOfClass:[NSDictionary class]]) {

#warning--------- 自定义部分 netxtDanMuData 字典格式 ------------------

       danMuIteam.text = danMuData[@"text"];
        
        danMuIteam.layer.borderColor = [UIColor yellowColor].CGColor;
        danMuIteam.layer.borderWidth = 1;
        
    }else if ([danMuData isKindOfClass:[NSString class]]) {
        
        danMuIteam.text = danMuData;
       
    }

    
    danMuIteam.textColor = self.danMuTexCorlor;
    
    [self addSubview:danMuIteam];

    self.nextDanMuIndex = index + self.lineNumber;
    
    CGFloat danMuSpeed = (frame.origin.x + frame.size.width)/time;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((danMuIteam.width + frame.origin.x - self.width) / danMuSpeed * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        if (index + self.lineNumber >= self.danMuArray.count ) {
            
            
            [self.loadDanmuLineArray addObject:[NSString stringWithFormat:@"%ld",(long)lineIndex]];
            
            
            if (self.loadDanmuLineArray.count == self.lineNumber) {
                
                 [self.loadDanmuLineArray removeAllObjects];
                
                if (self.delegate && [self.delegate respondsToSelector:@selector(lastDanMuThrough)]) {
                    
                    if (self.isRemoveDanMuArray) {
                        
                         [self.danMuArray removeAllObjects];
                    }
                    
                    [self.delegate lastDanMuThrough];
                }
          
            }
        }

        self.danMuEndBlock(frame,index,danMuSpeed,lineIndex);
  
    });
    

    [UIView animateWithDuration:time delay:0.f options:UIViewAnimationOptionCurveLinear animations:^{
        
        danMuIteam.x = - danMuIteam.width;
        
    } completion:^(BOOL finished) {
        

        [danMuIteam removeFromSuperview];
        
        if (self.subviews.count == 0) {
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(endDanMu)]) {
                
                 [self.delegate endDanMu];
            }

     
        }
        
    }];
    
    
}









/*
 * 根据tag 获取屏幕上某条弹幕 tag值为弹幕数组下标
 */
- (NSArray *)getDanMuLabels {
  
    return self.subviews;
}


/*
 * 计算字体宽度
 */

- (CGFloat)fitText:(NSString *)text WithforFont:(NSInteger)fontSize {
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    CGFloat fitWidth = [text boundingRectWithSize:CGSizeMake(9999999999, 30) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:dic context:nil].size.width;
    
    return fitWidth < self.maxDanMuWidth ? fitWidth : self.maxDanMuWidth;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
