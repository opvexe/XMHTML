//
//  EX_BaseViewController.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EX_BaseViewControllerProtocal.h"
@interface EX_BaseViewController : UIViewController<EX_BaseViewControllerProtocal>

/**
 *  右自定义view
 */
@property (nonatomic,strong) UIView *navigationRightView;
/**
 *  左边
 */
@property (nonatomic,strong) UIView *navigationleftView;
/**
 *  网络失败 显示 视图
 */
-(void)networkErrorWithView:(UIView*)view;
/**
 *  刷 新数据
 */
-(void)reloadDataSoucre;

/**
 *  占位图
 *
 *  @param title     <#title description#>
 *  @param message   <#message description#>
 *  @param image     <#image description#>
 *  @param superView <#superView description#>
 */
- (void)createPlaceholderView:(NSString *) title
                      message:(NSString *)message
                        image:(UIImage *)image
                     withView:(UIView *)superView;

/**
 *  占位图
 *
 *  @param title        <#title description#>
 *  @param message      <#message description#>
 *  @param image        <#image description#>
 *  @param superView    <#superView description#>
 *  @param reloadAction <#reloadAction description#>
 */
- (void)createPlaceholderView:(NSString *) title
                      message:(NSString *)message
                        image:(UIImage *)image
                     withView:(UIView *)superView action:(SEL)reloadAction;

- (void)createPlaceholderView:(NSString *) title
                      message:(NSString *)message
                        image:(UIImage *)image
                     withView:(UIView *)superView refTitle:(NSString *)reftitle action:(SEL)reloadAction;

/**
 删除占位图
 */
- (void)removePlaceholderView;
@end
