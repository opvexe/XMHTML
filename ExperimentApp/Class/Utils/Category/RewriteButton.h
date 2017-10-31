//
//  RewriteButton.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/31.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Button图片文字的方向

 - EXDirectionTypeTitleRight: EXDirectionTypeTitleRight description
 - EXDirectionTypeTitleLeft: EXDirectionTypeTitleLeft description
 */
typedef NS_ENUM(NSUInteger,EXDirectionType) {
    ButtonDisplayTypeImageLeftTileRight  = 1,          
    ButtonDisplayTypeImageUpTileDown   = 2,
};
@interface RewriteButton : UIButton

@property (nonatomic,assign) EXDirectionType directionType;
@end
