//
//  EX_TabBarController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_TabBarController.h"
#import "EX_NavigationController.h"
#import "EX_ProfileController.h"
#import "EX_PracticeController.h"
#import "EX_NewsController.h"

@interface EX_TabBarController ()

@end

@implementation EX_TabBarController


-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initMainController];
    
    ///MARK: 去除掉底部线
    self.tabBar.backgroundImage = [UIImage new];
    self.tabBar.shadowImage = [UIImage new];
    self.tabBar.tintColor = [UIColor brownColor];
}

-(void)initMainController{
    
    EX_PracticeController *practiceContrller = [[EX_PracticeController alloc]init];
    EX_NavigationController *practiceNavigation = [self setChildVC:practiceContrller title:@"练习" imageName:@"tabbar_home" withSelectedName:@"tabbar_home_selected"];
    
    EX_NewsController *newsContrller = [[EX_NewsController alloc]init];
    EX_NavigationController *newsNavigation = [self setChildVC:newsContrller title:@"视频" imageName:@"tabbar_discover" withSelectedName:@"tabbar_discover_selected"];
  
    EX_ProfileController *profileContrller = [[EX_ProfileController alloc]init];
    EX_NavigationController *profileNavigation = [self setChildVC:profileContrller title:@"我的" imageName:@"tabbar_profile" withSelectedName:@"tabbar_profile_selected"];
    
    self.viewControllers = @[practiceNavigation,newsNavigation,profileNavigation];
    
}
- (EX_NavigationController *)setChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imgName withSelectedName:(NSString *)selectedName{
    
    vc.tabBarItem.title                = title;
    vc.tabBarItem.image     = [[UIImage imageNamed:imgName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12.0],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor brownColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:12.0],NSFontAttributeName,nil] forState:UIControlStateSelected];
    EX_NavigationController *nav = [[EX_NavigationController alloc]initWithRootViewController:vc];
    
    return nav;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    [self beginAnimation];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    [self beginAnimation];
}

- (void)beginAnimation{
    CATransition *animation         = [[CATransition alloc]init];
    animation.duration              = 0.5;
    animation.type                  = kCATransitionFade;
    animation.subtype               = kCATransitionFromRight;
    animation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.accessibilityFrame    = CGRectMake(0, 64, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
    [self.view.layer addAnimation:animation forKey:@"switchView"];
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
