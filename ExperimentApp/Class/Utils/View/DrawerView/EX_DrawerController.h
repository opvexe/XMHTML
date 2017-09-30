//
//  EX_DrawerController.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EX_DrawerController : UIViewController

///MARK: 左边平移
-(void)showLeft;
///MARK: 移除平移手势
-(void)removePanGesture;
@end
