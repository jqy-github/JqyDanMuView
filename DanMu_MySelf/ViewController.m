//
//  ViewController.m
//  DanMu_MySelf
//
//  Created by 开发者 on 17/4/20.
//  Copyright © 2017年 J丶Qy. All rights reserved.
//

#import "ViewController.h"

#import "JqyDanMuView.h"

@interface ViewController ()<JqyDanMuViewDelegate>

{
    
    JqyDanMuView *danMuView;
    UITextField *textField ;
    UIButton *sendBtn;
    UIImageView *backImV;
    UIImage *backImage;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    backImage = [[UIImage imageNamed:@"鸣人.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    backImV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 50, K_Width - 10, (K_Width - 10) * backImage.size.height / backImage.size.width)];
    
    backImV.image = backImage;
 
    [self.view addSubview:backImV];
    
    
    danMuView = [[JqyDanMuView alloc]initWithFrame:backImV.frame];
    
     danMuView.danMuTexCorlor = [UIColor whiteColor];
    danMuView.danMuArray = [NSMutableArray arrayWithArray:@[@"qwewd地方各方",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"生产发v二傻子在",@"无数次打Evo你失踪嗯哦",@"三餐做",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 "]] ;

    danMuView.delegate = self;
    danMuView.lineNumber = 5;
    danMuView.throughTime = 8;
    [self.view addSubview:danMuView];

    [danMuView startSendDanMuRightDistance:5];
    
    textField = [[UITextField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(danMuView.frame) + 5, danMuView.width - 100, 30)];
    textField.backgroundColor = [UIColor lightGrayColor];
    [textField addTarget:self action:@selector(write:) forControlEvents:UIControlEventEditingChanged];
    textField.placeholder = @"说点什么吧...";
    [self.view addSubview:textField];
    
    
    sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(textField.frame) + 10, textField.y, 80, textField.height)];
    sendBtn.backgroundColor = [UIColor cyanColor];
    [sendBtn setTitle:@"发射" forState:UIControlStateNormal];
    
    [sendBtn addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
  
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)send {
    
    danMuView.handSendDanMuData = @{@"text":textField.text};
    
   
    
    textField.text  = @"";
    
    [sendBtn removeFromSuperview];
    [self.view endEditing:YES];
}


- (void)write:(UITextField *)field {
    
    if ([field.text isEqualToString:@""]) {
        
        [sendBtn removeFromSuperview];
    }else {
        [self.view addSubview:sendBtn];
    }
}

#pragma mark ------- 代理回调 ------

- (void)lastDanMuThrough {
    
     danMuView.danMuArray = [NSMutableArray arrayWithArray:@[@"qwewd地方各方",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"生产发v二傻子在",@"无数次打Evo你失踪嗯哦",@"三餐做",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 ",@"sd生产法分为充分那我in已VOA你 ",@"的v发射的v副队长发v",@"的发v股份保险股份",@"POIu'sdfojdofvjapj",@"sDdfbiwdwiJ",@"sd生产法分为充分那我in已VOA你 "]] ;
    
    [danMuView startSendDanMuRightDistance:30];
    
    NSLog(@"弹幕装完了");
}

- (void)endDanMu {
    

    NSLog(@"弹幕走光了");
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
    
 
    NSLog(@"wwwwww:%f  hhhhhhh:%f",K_Width,K_Height);
    
    if (interfaceOrientation == 3 || interfaceOrientation == 4) {
        
        backImV.frame = CGRectMake(5, 0, K_Width - 10, (K_Width - 10) * backImage.size.height / backImage.size.width);
        danMuView.frame = backImV.frame;
        textField.frame = CGRectMake(10, CGRectGetMaxY(danMuView.frame) + 5, danMuView.width - 100, 30) ;
        sendBtn.frame = CGRectMake(CGRectGetMaxX(textField.frame) + 10, textField.y, 80, textField.height);
    
    }else {
        
        backImV.frame = CGRectMake(5, 50, K_Width - 10, (K_Width - 10) * backImage.size.height / backImage.size.width);
        danMuView.frame = backImV.frame;
        textField.frame = CGRectMake(10, CGRectGetMaxY(danMuView.frame) + 5, danMuView.width - 100, 30) ;
        sendBtn.frame = CGRectMake(CGRectGetMaxX(textField.frame) + 10, textField.y, 80, textField.height);
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
