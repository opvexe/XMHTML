//
//  RewriteButton.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/31.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "RewriteButton.h"

@implementation RewriteButton
-(void)layoutSubviews{
    [super layoutSubviews];
    
    switch (_directionType) {
        case ButtonDisplayTypeImageLeftTileRight:{
            self.imageView.x = 0;
            self.titleLabel.x = CGRectGetMaxX(self.imageView.frame)+5;
            break;
        }
        case ButtonDisplayTypeImageUpTileDown:{
            CGFloat midX = self.frame.size.width / 2;
            CGFloat midY = self.frame.size.height/ 2 ;
            self.titleLabel.center = CGPointMake(midX, midY + Number(10));
            self.imageView.center = CGPointMake(midX, midY - Number(10));
            break;
        }
            case ButtonDisplayTypeImageRightTileLeft:{
            self.titleLabel.x = 0;
            self.imageView.x = CGRectGetMaxX(self.titleLabel.frame)+5;
        }
            break;
        default:
        {
            _directionType = ButtonDisplayTypeImageLeftTileRight;
            CGFloat midX = self.frame.size.width / 2;
            self.imageView.x = midX - CGRectGetWidth(self.imageView.frame);
            self.titleLabel.x = CGRectGetMaxX(self.imageView.frame)+Number(10);
        }
            break;
    }
    
}

@end

