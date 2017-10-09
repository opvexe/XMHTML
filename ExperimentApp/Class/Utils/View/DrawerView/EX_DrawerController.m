//
//  EX_DrawerController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_DrawerController.h"
#import "EX_TabBarController.h"
#import "EX_LeftController.h"

static const CGFloat FullDistanceScale = 0.7;
@interface EX_DrawerController ()

@property(nonatomic, strong)UIView *mainView;
@property(nonatomic, strong)EX_TabBarController *rootViewController;
@property(nonatomic, strong)EX_LeftController *leftController;
@property(nonatomic, strong)UIPanGestureRecognizer *panGesture;
@property(nonatomic, strong)UIView *middleView;
@end

@implementation EX_DrawerController
{
    CGFloat startX ;
    CGFloat startMx;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initMain];
}

-(void)initMain{
    
    self.middleView = [[UIView alloc]initWithFrame:self.view.bounds];
    self.panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [self.middleView addGestureRecognizer:self.panGesture];
    [self.view addSubview:self.middleView];
    
    self.rootViewController = [[EX_TabBarController alloc]init];
    [self.middleView addSubview:self.rootViewController.view];
    
    self.leftController = [[EX_LeftController alloc]init];
    CGRect rec = self.leftController.view.frame;
    rec.origin.x = -X_ScreenWidth;
    self.leftController.view.frame = rec;
    
    [self.view addSubview:self.leftController.view];
}



-(void)removePanGesture{
    [self.middleView removeGestureRecognizer:self.panGesture];
}
-(void)panAction:(UIPanGestureRecognizer *)recongnizer{
    
    CGFloat offsetX = [recongnizer translationInView:self.view].x;
    if (offsetX>=0) {
        CGRect rec = self.leftController.view.frame;
        rec.origin.x = -X_ScreenWidth +offsetX;
        self.leftController.view.frame = rec;
    }
    if (recongnizer.state == UIGestureRecognizerStateEnded) {
        if (offsetX>X_ScreenWidth*(FullDistanceScale/2.0)) {
            [self showLeft];
        }else{
            [self showHome];
        }
    }
}
-(void)showLeft{
    [self leftAnimate:@"left"];
}

-(void)showHome{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.leftController.view.frame;
        rect.origin.x = -X_ScreenWidth;
        self.leftController.view.frame = rect;
        [self.mainView removeFromSuperview];
        [self leftAnimate:@"home"];
    }];
}


-(void)leftAnimate:(NSString *)animate{
    [UIView animateWithDuration:0.3 delay:0. options:UIViewAnimationOptionCurveEaseOut animations:^{
        if ([animate isEqualToString:@"left"]) {
            CGRect rect = self.leftController.view.frame;
            rect.origin.x = -X_ScreenWidth + self.view.frame.size.width*FullDistanceScale;
            self.leftController.view.frame = rect;
            CGFloat mainViewX = self.leftController.view.frame.origin.x + self.leftController.view.frame.size.width;
            self.mainView = [[UIView alloc]initWithFrame:CGRectMake(mainViewX, 0, X_ScreenWidth, X_ScreenHeight)];
            self.mainView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
            [self.view insertSubview:self.mainView belowSubview:self.leftController.view];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showHome)];
            [self.mainView addGestureRecognizer:tap];
            
            UIPanGestureRecognizer *backPanGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(recoverPanGes:)];
            [self.mainView addGestureRecognizer:backPanGes];
        }else{
            [self.mainView removeFromSuperview];
        }
    } completion:^(BOOL finished) {
        
    }];
}


-(void)recoverPanGes:(UIPanGestureRecognizer *)pan{
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        startX = self.leftController.view.frame.origin.x;
        startMx = self.mainView.frame.origin.x;
    }
    CGFloat offsetX = [pan translationInView:self.view].x;
    CGRect offsetRect = self.leftController.view.frame;
    offsetRect.origin.x = startX + offsetX;
    self.leftController.view.frame = offsetRect;
    
     NSLog(@"侧滑:%lf",offsetX);
    ///MARK: 右侧偏移量
    CGRect mainFram = self.mainView.frame;
    mainFram.origin.x = startMx + offsetX;
    self.mainView.frame = mainFram;

    if (pan.state == UIGestureRecognizerStateEnded) {
        CGFloat menueShowWidth = X_ScreenWidth +self.leftController.view.frame.origin.x;
        if (menueShowWidth>(X_ScreenWidth*(FullDistanceScale/2.0))) {
            [UIView animateWithDuration:0.3 animations:^{
                
                CGRect rect = self.leftController.view.frame;
                rect.origin.x = -X_ScreenWidth +self.view.frame.size.width*FullDistanceScale;
                self.leftController.view.frame = rect;
                
                CGRect leftRect = self.mainView.frame;
                leftRect.origin.x = self.leftController.view.frame.origin.x + self.leftController.view.frame.size.width;
                self.mainView.frame = leftRect;
            }];
        }else{
            [self showHome];
        }
    }
}


@end
