//
//  EX_Tools.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_Tools.h"

@implementation EX_Tools
+(CGFloat)getHeightContain:(NSString *)string font:(UIFont *)font Width:(CGFloat) width{
    
    if (string ==nil) {
        
        return 0;
    }
    
    NSAttributedString *astr = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:font}];
    
    CGSize contanSize = CGSizeMake(width, CGFLOAT_MAX);
    
    if (iOS7) {
        
        CGRect rect =[astr boundingRectWithSize:contanSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
        
        return rect.size.height;
    }else{
        
        CGSize s=[string sizeWithFont:font constrainedToSize:contanSize lineBreakMode:NSLineBreakByCharWrapping];
        return s.height;
        
    }
    
}

+(CGFloat)getWidthContain:(NSString *)string font:(UIFont *)font Height:(CGFloat) height{
    
    
    if (string ==nil) {
        
        return 0;
    }
    
    NSAttributedString *astr = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:font}];
    
    CGSize contanSize = CGSizeMake(CGFLOAT_MAX,height );
    
    if (iOS7) {
        
        CGRect rect =[astr boundingRectWithSize:contanSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
        
        return rect.size.width;
    }else{
        
        CGSize s=[string sizeWithFont:font constrainedToSize:contanSize lineBreakMode:NSLineBreakByCharWrapping];
        return s.width;
        
    }
    
}

@end
