//
//  EX_PracticeController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_PracticeController.h"
#import "EX_DrawerController.h"

@interface EX_PracticeController ()

@end

@implementation EX_PracticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftOpen:) image:@"room_btn_more" highImage:@"room_btn_more"];
    self.navigationItem.title = @"公共基础";
}

-(void)leftOpen:(id)sender{
    [(EX_DrawerController *)KEY_WINDOW.rootViewController showLeft];
}


@end
