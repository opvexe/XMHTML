//
//  EXHotNewsViewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/27.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXHotNewsViewController.h"
#import "EXMoveShootViewController.h"
#import "EXCopyEditorViewController.h"
@interface EXHotNewsViewController ()
@property(nonatomic,strong)UIButton *shootButton;
@property(nonatomic,strong)UIButton *manuscriptButton;
@end

@implementation EXHotNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"热新闻";
    
    self.shootButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.shootButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.shootButton.titleLabel.numberOfLines = 0;
    self.shootButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
    [self.shootButton setTitle:@"移动拍摄 \n  &" forState:UIControlStateNormal];
    [self.shootButton setTitle:@"移动拍摄 \n  &" forState:UIControlStateHighlighted];
    [self.shootButton setTitle:@"移动拍摄 \n  &" forState:UIControlStateSelected];
    [self.shootButton setTitleColor:BaseTitleColor forState:UIControlStateNormal];
    [self.shootButton setTitleColor:BaseTitleColor forState:UIControlStateSelected];
    [self.shootButton setTitleColor:BaseTitleColor forState:UIControlStateHighlighted];
    [self.shootButton setTitleColor:BaseTitleColor forState:UIControlStateDisabled];
    [self.shootButton setTag:100];
    [self.shootButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.shootButton];
    
    self.manuscriptButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.manuscriptButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.manuscriptButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
    [self.manuscriptButton setTitle:@"文稿创作" forState:UIControlStateNormal];
    [self.manuscriptButton setTitle:@"文稿创作" forState:UIControlStateHighlighted];
    [self.manuscriptButton setTitle:@"文稿创作" forState:UIControlStateSelected];
    [self.manuscriptButton setTitleColor:BaseTitleColor forState:UIControlStateNormal];
    [self.manuscriptButton setTitleColor:BaseTitleColor forState:UIControlStateSelected];
    [self.manuscriptButton setTitleColor:BaseTitleColor forState:UIControlStateHighlighted];
    [self.manuscriptButton setTitleColor:BaseTitleColor forState:UIControlStateDisabled];
    [self.manuscriptButton setTag:101];
    [self.manuscriptButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.manuscriptButton];
    
    [self.shootButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
    [self.manuscriptButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.shootButton.mas_centerX);
        make.top.mas_equalTo(self.shootButton.mas_bottom);
    }];
}

-(void)dothings:(UIButton *)sender{
    switch (sender.tag - 100) {
        case 0:
        {
            EXMoveShootViewController *vc = [[EXMoveShootViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            case 1:
        {
            EXCopyEditorViewController *vc = [[EXCopyEditorViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
