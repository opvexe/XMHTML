//
//  NSTextAttachment+EXText.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/1.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LMTextAttachmentType) {
    LMTextAttachmentTypeImage,              //图片
    LMTextAttachmentTypeCheckBox,           //
//    LMTextAttachmentTypeVideo,              //视频
};
@interface NSTextAttachment (EXText)

+ (instancetype)checkBoxAttachment;


/**
 * 设置HTML 文本图片的位置

 @param image image description
 @param width width description
 @return return value description
 */
+ (instancetype)attachmentWithImage:(UIImage *)image width:(CGFloat)width;

@property (nonatomic, assign) LMTextAttachmentType attachmentType;
@property (nonatomic, strong) id userInfo;

@end
