//
//  EXCopyEditorViewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXCopyEditorViewController.h"
#import "EXKeyboardPhotoViewController.h"
#import "EXPhotoLibraryManager.h"
#import "EXSegmentedControl.h"
#import "EXEditorTextView.h"
@interface EXCopyEditorViewController ()<UITextViewDelegate,UITextFieldDelegate,EXSegmentedControlDelegate,EXKeyboardPhotoControllerDelegate>
@property(nonatomic,strong)EXEditorTextView *textView;
@property(nonatomic,assign)CGFloat keyboardSpacingHeight;
@property(nonatomic,strong)EXSegmentedControl *keyboardInputView;
@property (nonatomic,strong) EXKeyboardPhotoViewController *keyBoardViewController;
@end

@implementation EXCopyEditorViewController
static CGFloat const KeyboardInputViewHeight = 40.f;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithRightNavationView];
    [self initWithTextView];
    [self initWithKeyboardInputView];
    [self requestALAssetsLibraryAuthorization];
    [self requestALAssetsCameraAuthorization];
    ///注册键盘弹起通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [self.keyboardInputView addTarget:self action:@selector(changeTextInputView:) forControlEvents:UIControlEventValueChanged];
}

/**
 * 获取相册权限
 */
-(void)requestALAssetsLibraryAuthorization{
    [EXPhotoLibraryManager requestALAssetsLibraryAuthorizationWithCompletion:^(Boolean isAuth) {
        if (isAuth) {
            NSLog(@"相册授权成功");
        }else{
            NSLog(@"相册授权失败");
            NSURL *settingUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:settingUrl]) {
                [[UIApplication sharedApplication] openURL:settingUrl];
            }
        }
    }];
}

/**
 * 获取相机权限
 */
-(void)requestALAssetsCameraAuthorization{
    [EXPhotoLibraryManager requestALAssetsCameraAuthorizationWithCompletion:^(Boolean isAuth) {
        if (isAuth) {
            NSLog(@"相机权限授权成功");
        }else{
            NSLog(@"相机权限授权失败");
            NSURL *settingUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:settingUrl]) {
                [[UIApplication sharedApplication] openURL:settingUrl];
            }
        }
    }];
}

/**
 * 初始化键盘顶部视图
 */
-(void)initWithKeyboardInputView{
    NSArray *items = @[
                       [UIImage imageNamed:@"ABC_icon"],
                       [UIImage imageNamed:@"style_icon"],
                       [UIImage imageNamed:@"img_icon"],
                       [UIImage imageNamed:@"clear_icon"]
                       ];
    self.keyboardInputView = [[EXSegmentedControl alloc] initWithItems:items];
    self.keyboardInputView.delegate = self;
    self.keyboardInputView.changeSegmentManually = YES;
    self.textView.inputAccessoryView = self.keyboardInputView;
    CGRect rect = self.view.bounds;
    rect.size.height = KeyboardInputViewHeight;
    self.keyboardInputView.frame = rect;
    
}

#pragma mark EXSegmentedControlDelegate
- (void)ex_segmentedControl:(EXSegmentedControl *)control didTapAtIndex:(NSInteger)index{
    if (index == control.numberOfSegments - 1) {
        [self.textView resignFirstResponder];
        return;
    }
    if (index != control.selectedSegmentIndex) {
        [control setSelectedSegmentIndex:index animated:YES];
    }
}

/**
 * 点击keyboardInputView
 
 @param control control description
 */
-(void)changeTextInputView:(EXSegmentedControl *)control{
    CGRect rect = self.view.bounds;
    rect.size.height = self.keyboardSpacingHeight - CGRectGetHeight(self.keyboardInputView.frame);
    switch (control.selectedSegmentIndex) {
        case 1:
        {
            NSLog(@"字体");
        }
            break;
            
        case 2:
        {
            NSLog(@"图片");
            UIView *inputView = [[UIView alloc] initWithFrame:rect];
            self.keyBoardViewController.view.frame = rect;
            [inputView addSubview:self.keyBoardViewController.view];
            self.textView.inputView = inputView;
        }
            break;
        default:
            self.textView.inputView = nil;
            break;
    }
    [self.textView reloadInputViews]; ///重新载入输入视图，一般就是刷新键盘
}
/**
 * 初始化编辑视图
 */
-(void)initWithTextView{
    _textView = [[EXEditorTextView alloc] init];
    _textView.delegate = self;
    _textView.titleTextField.delegate = self;
    [self.view addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(self.view).multipliedBy(.5);
    }];
}

/**
 * 键盘弹起通知
 
 @param notification notification description
 */
-(void)keyboardWillShow:(NSNotification *)notification{
    NSDictionary *info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    if (self.keyboardSpacingHeight == keyboardSize.height) {
        return;
    }
    self.keyboardSpacingHeight = keyboardSize.height;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        CGRect rect = self.view.bounds;
        rect.origin.y = [self.topLayoutGuide length];
        rect.size.height -= rect.origin.y;
        self.textView.frame = rect;
        
        UIEdgeInsets insets = self.textView.contentInset;
        insets.bottom = self.keyboardSpacingHeight;
        self.textView.contentInset = insets;
    } completion:nil];
}
/**
 * 键盘隐藏通知
 
 @param notification notification description
 */
-(void)keyboardWillHide:(NSNotification *)notification{
    if (self.keyboardSpacingHeight == 0) {
        return;
    }
    self.keyboardSpacingHeight = 0;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        CGRect rect = self.view.bounds;
        rect.origin.y = [self.topLayoutGuide length];
        rect.size.height -= rect.origin.y;
        self.textView.frame = rect;
        
        UIEdgeInsets insets = self.textView.contentInset;
        insets.bottom = self.keyboardSpacingHeight;
        self.textView.contentInset = insets;
    } completion:nil];
}


#pragma mark  <UITextViewDelegate>
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.text.length == 0) {
        textField.text = textField.placeholder;
    }
    self.textView.editable = NO;
    [textField resignFirstResponder];
    self.textView.editable = YES;
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    [self.keyboardInputView setSelectedSegmentIndex:0 animated:NO];
    return YES;
}


#pragma mark <EXKeyboardPhotoControllerDelegate>

-(void)xm_KeyboardPhotoController:(EXKeyboardPhotoViewController *)viewController initWithSendImage:(UIImage *)image{
    
}
-(void)xm_KeyboardPhotoController:(EXKeyboardPhotoViewController *)viewController popPreviewController:(UIViewController *)previewController{
    
}






























/**
 * 设置右侧导航栏按钮
 */
-(void)initWithRightNavationView{
    UIBarButtonItem *pulishButton = [UIBarButtonItem itemWithTarget:self action:@selector(publish:) text:@"发布"];
    UIBarButtonItem *lookButton =  [UIBarButtonItem itemWithTarget:self action:@selector(look:) text:@"预览"];
    pulishButton.tag = 100;
    lookButton.tag   = 101;
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: pulishButton,lookButton,nil]];
}

-(void)publish:(id)sender{
    NSLog(@"发布");
}

-(void)look:(id)sender{
    NSLog(@"预览");
}


/**
 * 懒加载控件
 
 @return return value description
 */
-(EXKeyboardPhotoViewController *)keyBoardViewController{
    if (!_keyBoardViewController) {
        _keyBoardViewController = [[EXKeyboardPhotoViewController alloc]init];
        _keyBoardViewController.delegate = self;
    }
    return _keyBoardViewController;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


