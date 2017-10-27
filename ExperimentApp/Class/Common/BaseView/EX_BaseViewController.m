//
//  EX_BaseViewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_BaseViewController.h"

@interface EX_BaseViewController ()
@property(nonatomic,strong)UIView *placeholderView;
@end

@implementation EX_BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 * 导航栏

 @param navigationRightView 导航栏视图
 */
- (void)setNavigationRightView:(UIView *)navigationRightView{
    _navigationRightView = navigationRightView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navigationRightView];
}

-(void)setNavigationleftView:(UIView *)navigationleftView{
    _navigationleftView = navigationleftView;
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc] initWithCustomView:navigationleftView];
}


/**
 *  网络失败 显示 视图

 @param view <#view description#>
 */
-(void)networkErrorWithView:(UIView*)view {
    [self createPlaceholderView:nil message:@"你的网络好像被人蹭走了" image:[UIImage imageNamed:@"network"] withView:view action:@selector(reloadDataSoucre)];
}


/**
 占位图
 */
- (void)createPlaceholderView:(NSString *) title
                      message:(NSString *)message
                        image:(UIImage *)image
                     withView:(UIView *)superView
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self createPlaceholderView:title message:message image:image withView:superView action:nil];
    });
    
}
- (void)createPlaceholderView:(NSString *) title
                      message:(NSString *)message
                        image:(UIImage *)image
                     withView:(UIView *)superView action:(SEL)reloadAction{
    
    if (_placeholderView) {
        [_placeholderView removeFromSuperview];
        _placeholderView = nil;
    }
    if(superView==nil){
        superView=self.view;
    }
    
    _placeholderView = [[UIView alloc]initWithFrame:superView.bounds];
    [_placeholderView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin];
    [_placeholderView setAutoresizesSubviews:YES];
    [_placeholderView setBackgroundColor:[UIColor clearColor]];
    [superView addSubview:_placeholderView];
    
    CGRect pf = CGRectMake(0, 0, superView.bounds.size.width, 0);
    UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar_default"]];
    if(image){
        [icon setImage:image];
    }
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    icon.frame = CGRectMake(0,0, pf.size.width, image.size.height);
    [_placeholderView addSubview:icon];
    
    CGFloat y= icon.frame.size.height+Number(20);
    if(title){
        CGFloat height=[EX_Tools getHeightContain:title font:FontPingFangSC(15) Width:pf.size.width];
        
        UILabel *lblTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, y, pf.size.width, height)];
        [lblTitle setText:title];
        [lblTitle setFont:FontPingFangSC(15)];
        [lblTitle setTextColor:SubheadTitleColor];
        [lblTitle setTextAlignment:NSTextAlignmentCenter];
        [lblTitle setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [lblTitle setNumberOfLines:0];
        [lblTitle setBackgroundColor:[UIColor clearColor]];
        [_placeholderView addSubview:lblTitle];
        y=y+height+5;
    }
    
    if(message){
        UILabel *lblTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, y, pf.size.width, Number(20))];
        [lblTitle setText:message];
        [lblTitle setFont:FontPingFangSC(16)];
        [lblTitle setTextColor:SubheadTitleColor];
        [lblTitle setTextAlignment:NSTextAlignmentCenter];
        [lblTitle setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [lblTitle setAutoresizesSubviews:YES];
        [lblTitle setBackgroundColor:[UIColor clearColor]];
        [_placeholderView addSubview:lblTitle];
        y=y+Number(25);
    }
    //
    //    // 如果有重新加载方法，就显示重新加载按钮
    if(reloadAction){
        UIButton *reButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [reButton setFrame:CGRectMake(pf.size.width/2-Number(114)/2, y+5, Number(114), Number(30))];
        
        [reButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xffffff)] forState:UIControlStateNormal];
        [reButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xffffff)] forState:UIControlStateDisabled];
        [reButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xffffff)] forState:UIControlStateHighlighted];
        [reButton setTitle:@"重新加载" forState:UIControlStateNormal];
        [reButton setTitle:@"      加载中..." forState:UIControlStateDisabled];
        [reButton setTitleColor:UIColorFromRGB(0xff758c) forState:UIControlStateNormal];
        [reButton setTitleColor:UIColorFromRGB(0xff758c) forState:UIControlStateDisabled];
        [reButton.titleLabel setFont:FontPingFangSC(12)];
        [reButton addTarget:self action:reloadAction forControlEvents:UIControlEventTouchUpInside];
        [reButton setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin];
        reButton.layer.cornerRadius  = Number(15);
        reButton.layer.masksToBounds = YES;
        reButton.layer.borderColor =UIColorFromRGB(0xff758c).CGColor;
        reButton.layer.borderWidth = Number(0.5);
        [_placeholderView addSubview:reButton];
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        activityIndicator.tag=10;
        [activityIndicator setFrame:CGRectMake(Number(192)/2-Number(45), Number(15), Number(20), Number(20))];
        [reButton addSubview:activityIndicator];
        
    }
    pf.size.height=y;
    
    [_placeholderView setFrame:pf];
    [_placeholderView setCenter:CGPointMake(superView.center.x,superView.center.y)];
}

- (void)createPlaceholderView:(NSString *) title
                      message:(NSString *)message
                        image:(UIImage *)image
                     withView:(UIView *)superView refTitle:(NSString *)reftitle action:(SEL)reloadAction{
    if (_placeholderView) {
        [_placeholderView removeFromSuperview];
        _placeholderView = nil;
    }
    if(superView==nil){
        superView=self.view;
    }
    
    _placeholderView = [[UIView alloc]initWithFrame:superView.bounds];
    [_placeholderView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin];
    [_placeholderView setAutoresizesSubviews:YES];
    [_placeholderView setBackgroundColor:[UIColor clearColor]];
    [superView addSubview:_placeholderView];
    
    
    CGRect pf = CGRectMake(0, 0, superView.bounds.size.width, 0);
    UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar_default"]];
    if(image){
        [icon setImage:image];
    }
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    icon.frame = CGRectMake(0,0, pf.size.width, image.size.height);
    [_placeholderView addSubview:icon];
    CGFloat y= icon.frame.size.height+Number(20);
    if(title){
        CGFloat height=[EX_Tools getHeightContain:title font:FontPingFangSC(15) Width:pf.size.width];
        
        UILabel *lblTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, y, pf.size.width, height)];
        [lblTitle setText:title];
        [lblTitle setFont:FontPingFangSC(15)];
        [lblTitle setTextColor:SubheadTitleColor];
        [lblTitle setTextAlignment:NSTextAlignmentCenter];
        [lblTitle setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [lblTitle setNumberOfLines:0];
        [lblTitle setBackgroundColor:[UIColor clearColor]];
        [_placeholderView addSubview:lblTitle];
        y=y+height+5;
    }
    
    if(message){
        UILabel *lblTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, y, pf.size.width, Number(20))];
        [lblTitle setText:message];
        [lblTitle setFont:FontPingFangSC(16)];
        [lblTitle setTextColor:SubheadTitleColor];
        [lblTitle setTextAlignment:NSTextAlignmentCenter];
        [lblTitle setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [lblTitle setAutoresizesSubviews:YES];
        [lblTitle setBackgroundColor:[UIColor clearColor]];
        [_placeholderView addSubview:lblTitle];
        y=y+Number(25);
    }
    
    // 如果有重新加载方法，就显示重新加载按钮
    if(reloadAction){
        UIButton *reButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [reButton setFrame:CGRectMake(pf.size.width/2-Number(114)/2, y+5, Number(114), Number(30))];
        [reButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xffffff)] forState:UIControlStateNormal];
        [reButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xffffff)] forState:UIControlStateDisabled];
        [reButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xffffff)] forState:UIControlStateHighlighted];
        [reButton setTitle:reftitle forState:UIControlStateNormal];
        [reButton setTitle:reftitle forState:UIControlStateDisabled];
        [reButton setTitleColor:UIColorFromRGB(0xff758c) forState:UIControlStateNormal];
        [reButton setTitleColor:UIColorFromRGB(0xff758c) forState:UIControlStateDisabled];
        [reButton.titleLabel setFont:FontPingFangSC(12)];
        [reButton addTarget:self action:reloadAction forControlEvents:UIControlEventTouchUpInside];
        [reButton setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin];
        reButton.layer.cornerRadius  = Number(15);
        reButton.layer.masksToBounds = YES;
        reButton.layer.borderColor =UIColorFromRGB(0xff758c).CGColor;
        reButton.layer.borderWidth = Number(0.5);
        [_placeholderView addSubview:reButton];
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        activityIndicator.tag=10;
        [activityIndicator setFrame:CGRectMake(Number(192)/2-Number(45), Number(15), Number(20), Number(20))];
        [reButton addSubview:activityIndicator];
        
    }
    pf.size.height=y;
    
    [_placeholderView setFrame:pf];
    [_placeholderView setCenter:CGPointMake(superView.center.x,superView.center.y)];
}

- (void)removePlaceholderView{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (_placeholderView && _placeholderView!=nil) {
            [_placeholderView removeFromSuperview];
            _placeholderView = nil;
        }
    });
}






-(void)reloadDataSoucre{
    
}
/**
 获取数据源
 */
-(void)EX_GetDataSoucre{
    
}

/**
 添加视图
 */
-(void)EX_AddSubviews{
    
}
/**
 *  初始视图
 */
- (void)EX_initConfingViews{
    
}
/**
 *  配置数据
 */
- (void)EX_SetupViewModel{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
