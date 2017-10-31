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
        case EXDirectionTypeTitleLeft:
        {
            
        }
            break;
            
        case EXDirectionTypeTitleRight:
        {
            
        }
        default:
        {
            _directionType = EXDirectionTypeTitleLeft;
            
        }
            break;
    }
}

@end

