//
//  EXKeyboardPhotoViewController.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EXKeyboardPhotoViewController;

@protocol EXKeyboardPhotoControllerDelegate <NSObject>
/**
 * 发送预览图片

 @param viewController controller description
 @param image image description
 */
-(void)xm_KeyboardPhotoController:(EXKeyboardPhotoViewController *)viewController initWithSendImage:(UIImage *)image;
/**
 * 预览图片，调转到预览vc

 @param viewController controller description
 @param previewController previewController description
 */
-(void)xm_KeyboardPhotoController:(EXKeyboardPhotoViewController *)viewController popPreviewController:(UIViewController *)previewController;
@end
@interface EXKeyboardPhotoViewController : UIViewController

@property (nonatomic,weak) id <EXKeyboardPhotoControllerDelegate> delegate;
/**
 * 刷新界面
 */
-(void)reload;
@end
