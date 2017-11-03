//
//  EXPopView.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/3.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXPopView.h"

@interface EXPopView ()
@property(nonatomic,strong)UIView *maskView;

@end
@implementation EXPopView

/**
 * 弹出底部视图的遮罩
 
 @return return value description
 */
-(UIView *)maskView{
    if (!_maskView) {
        _maskView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        _maskView.alpha = 0.0f;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [_maskView addGestureRecognizer:tap];
    }
    return _maskView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}


//-(void)tap:(UITapGestureRecognizer *)tap{
//    if (isTop) { // 关闭顶部视图动画
//        [UIView animateWithDuration:0.3 animations:^{
//            self.maskView.alpha = 0.0;
//            self.bottomPopView.transform = CGAffineTransformIdentity;
//        }completion:^(BOOL finished) {
//            [self.maskView removeFromSuperview];
//            [self.bottomPopView removeFromSuperview];
//        }];
//    } else {    // 关闭顶部视图动画
//        [UIView animateWithDuration:0.3 animations:^{
//            self.bottomPopView.transform = CGAffineTransformIdentity;
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:0.2 animations:^{
//                self.view.layer.transform = CATransform3DIdentity;
//                self.maskView.alpha = 0.0;
//            } completion:^(BOOL finished) {
//                [self.maskView removeFromSuperview];
//                [self.bottomPopView removeFromSuperview];
//            }];
//        }];
//    }
//}
@end
