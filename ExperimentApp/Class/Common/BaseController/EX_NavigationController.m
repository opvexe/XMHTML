//
//  EX_NavigationController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_NavigationController.h"
@interface EX_NavigationController ()

@end

@implementation EX_NavigationController

+(void)initialize{
    UINavigationBar *navBar=[UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage createImageWithColor:PriceTextColor] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] =  [UIFont boldSystemFontOfSize:15.0];
    navBar.shadowImage=[[UIImage alloc]init];  //隐藏掉导航栏底部的那条线
    [navBar setTitleTextAttributes:textAttrs];
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    // 如果滑动移除控制器的功能失效，清空代理(让导航控制器重新设置这个功能)
    self.interactivePopGestureRecognizer.delegate = nil;
   // 禁止使用系统自带的滑动手势,防止从滑动，返回存在未知bug。
    self.interactivePopGestureRecognizer.enabled = NO;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0)
    {
         viewController.navigationItem.leftBarButtonItem =[UIBarButtonItem itemWithTarget:self action:@selector(goback) image:@"back_btn" highImage:@"back_btn"];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)goback{
    [self popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
