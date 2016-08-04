//
//  ViewController.m
//  xf-textOneByOne
//
//  Created by 朱晓峰 on 16/8/3.
//  Copyright © 2016年 朱晓峰. All rights reserved.
//
/*
 关联声音效果
 内存消耗大
 */
#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,copy)NSString * str;
@property(nonatomic,strong)UILabel * lable;
@property(nonatomic,strong)UIButton *btn;
@end

@implementation ViewController
-(UIButton *)btn{
    if (!_btn) {
        _btn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-120, self.view.frame.size.height-30, 120, 30)];
        [_btn setTitle:@"点击跳过" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        _btn.backgroundColor=[UIColor clearColor];
        [_btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _btn.backgroundColor=[UIColor redColor];
        
        [self.view addSubview:_btn];
    }
    
    return _btn;
}
-(UILabel *)lable{
    if (!_lable) {
        _lable = [[UILabel alloc]initWithFrame:self.view.bounds];
        _lable.textColor=[UIColor blackColor];
        
        _lable.backgroundColor=[UIColor whiteColor];
        _lable.numberOfLines=0;
//        _lable.textAlignment=1;
        _lable.font=[UIFont systemFontOfSize:15];
        [self.view addSubview:_lable];
    }
    return _lable;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(animationLabel) object:nil];
    
    [thread start];
    self.str=@"个人概况\n朱晓峰\n学    历：   本科\n现 居 地： 上海 浦东新区\n联系电话：  18701854182\n电子邮件：441785311@qq.com\n求职意向\n工作性质： 全职\n目标职位： iOS开发工程师\n到岗时间：2周内\n期望薪资：10k＋\n职业技能\n熟悉OC，了解C语言,Swift开发语言，了解HTML5及JS语言;\n熟悉iOS SDK，熟练使用Xcode进行iOS程序开发、调试、优化\n熟悉自定义view、常用动画，熟练掌握纯代码/storyboard/xib编程\n熟练使用MVC、代理、单例、KVO等常用设计模式，掌握delegate、block、通知中心等传值方式，并能熟练          使用Category、宏定义等方法解决问题\n 熟悉iOS多线程，GCD等技术\n熟悉http协议，了解tcp/ip协议\n熟悉适配\n 熟悉Git\n熟练使用AFNetworking，MJExtension，SDWebImage，SVProgressHUD，JSONModel，MJRefresh，RESideMenu、二维码扫描等主流第三方库\n熟练使用第三方SDK实现支付、地图、分享、推送，即时通信等功能的开发\n 了解OC的内存管理机制\n了解md5加密，了解基本算法";
    
}
-(void)btnClick{
    [self.lable removeFromSuperview];
}
- (void)animationLabel
{
    for (NSInteger i = 0; i < self.str.length; i++)
    {
        [self performSelectorOnMainThread:@selector(refreshUIWithContentStr:) withObject:[self.str substringWithRange:NSMakeRange(0, i+1)] waitUntilDone:YES];
//        [NSThread sleepForTimeInterval:0.3];
    }
    [UIView animateWithDuration:10 animations:^{
        self.lable.alpha=0;
        
    } completion:^(BOOL finished) {
        [self.lable removeFromSuperview];
        
    }];
}

- (void)refreshUIWithContentStr:(NSString *)contentStr
{
    
    self.lable.text = contentStr;
    [self btn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
