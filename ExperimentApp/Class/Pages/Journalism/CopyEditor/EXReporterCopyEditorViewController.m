//
//  EXCopyEditorViewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXReporterCopyEditorViewController.h"
#import "EXKeyboardPhotoViewController.h"
#import "EXKeyBoardFontViewController.h"
#import "EXPhotoLibraryManager.h"
#import "EXSegmentedControl.h"
#import "EXEditorTextView.h"
#import "EXTextHTMLParser.h"
#import "EXUpPhotoCollectionViewCell.h"
#import "EXReporterAddFootageController.h"
#import "NSTextAttachment+EXText.h"
#import "EXReporterPreviewController.h"

@interface EXReporterCopyEditorViewController ()<UITextViewDelegate,UITextFieldDelegate,EXSegmentedControlDelegate,EXKeyboardPhotoControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)EXEditorTextView *textView;
@property(nonatomic,assign)CGFloat keyboardSpacingHeight;
@property(nonatomic,strong)EXSegmentedControl *keyboardInputView;
@property(nonatomic,strong)EXKeyboardPhotoViewController *keyBoardViewController;
@property(nonatomic,strong)EXKeyBoardFontViewController *keyBoardFontViewController;
@property(nonatomic,strong)UITableView *pictureTableView;
@property(nonatomic,strong)UICollectionView *upPhotoCollectionView;
@end

static CGFloat const KeyboardInputViewHeight = 40.f;
@implementation EXReporterCopyEditorViewController
{
    NSRange _lastSelectedRange;
}

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
        [self.upPhotoCollectionView registerClass:[EXUpPhotoCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([EXUpPhotoCollectionViewCell class])];
}



- (void)layoutTextView {
    CGRect rect = self.view.bounds;
    rect.origin.y = [self.topLayoutGuide length];
    rect.size.height -= rect.origin.y;
    self.textView.frame = rect;
    
    UIEdgeInsets insets = self.textView.contentInset;
    insets.bottom = self.keyboardSpacingHeight;
    self.textView.contentInset = insets;
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
//            NSURL *settingUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//            if ([[UIApplication sharedApplication] canOpenURL:settingUrl]) {
//                [[UIApplication sharedApplication] openURL:settingUrl];
//            }
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
            UIView *inputView = [[UIView alloc] initWithFrame:rect];
            self.keyBoardFontViewController.view.frame = rect;
            [inputView addSubview:self.keyBoardFontViewController.view];
            self.textView.inputView = inputView;
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
        [self layoutTextView];
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
        [self layoutTextView];
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
    //将原始图片存入到 Document 目录下，将图片文件 URL 与 Attachment 绑定。
    float actualWidth = image.size.width * image.scale;
    float boundsWidth = CGRectGetWidth(self.view.bounds) - 8.f * 2;
    float compressionQuality = boundsWidth / actualWidth;
    if (compressionQuality > 1) {
        compressionQuality = 1;
    }
    NSData *degradedImageData = UIImageJPEGRepresentation(image, compressionQuality);
    UIImage *degradedImage = [UIImage imageWithData:degradedImageData];
    
    NSTextAttachment *attachment = [self insertImage:degradedImage];
    [self.textView resignFirstResponder];
    [self.textView scrollRangeToVisible:_lastSelectedRange];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 实际应用时候可以将存本地的操作改为上传到服务器，URL 也由本地路径改为服务器图片地址。
        NSURL *documentDir = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                                    inDomain:NSUserDomainMask
                                                           appropriateForURL:nil
                                                                      create:NO
                                                                       error:nil];
        NSURL *filePath = [documentDir URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", [NSDate date].description]];
        NSData *originImageData = UIImagePNGRepresentation(image);
        if ([originImageData writeToFile:filePath.path atomically:YES]) {
            attachment.attachmentType = LMTextAttachmentTypeImage;
            attachment.userInfo = filePath.absoluteString;
        }
    });
}

- (void)xm_imageSettingsController:(EXKeyboardPhotoViewController *)viewController presentImagePickerView:(UIViewController *)picker{
    [self presentViewController:picker animated:YES completion:nil];
}

/**
 * 跳转到图片预览界面

 @param viewController viewController description
 @param previewController previewController description
 */
-(void)xm_KeyboardPhotoController:(EXKeyboardPhotoViewController *)viewController popPreviewController:(UIViewController *)previewController{
    
}

#pragma mark 选择图片上传<upPhotoCollectionView>
- (UICollectionView *)upPhotoCollectionView{
    if(!_upPhotoCollectionView){
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _upPhotoCollectionView =[[UICollectionView alloc] initWithFrame:CGRectZero
                                                 collectionViewLayout:layout];
        _upPhotoCollectionView.backgroundColor = [UIColor clearColor];
        _upPhotoCollectionView.showsHorizontalScrollIndicator = NO;
        _upPhotoCollectionView.showsVerticalScrollIndicator =NO;
        _upPhotoCollectionView.dataSource = self;
        _upPhotoCollectionView.delegate = self;
    }
    return _upPhotoCollectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = SCREEN_WIDTH/5 - Number(30);
    return  CGSizeMake(width, width);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return Number(5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return Number(5);
}

- ( UIEdgeInsets )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section {
    //top, left, bottom, right
    return UIEdgeInsetsMake ( Number(10), Number(5) ,Number(10), Number(5));
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EXUpPhotoCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EXUpPhotoCollectionViewCell class]) forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    EXReporterAddFootageController *addFootage = [[EXReporterAddFootageController alloc]init];          ///记者编辑模式
    [self.navigationController pushViewController:addFootage animated:YES];
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
    EXReporterPreviewController *preview = [[EXReporterPreviewController alloc]init];
    preview.HTML = [self exportHTML];
    [self.navigationController pushViewController:preview animated:YES];
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

-(EXKeyBoardFontViewController *)keyBoardFontViewController{
    if (!_keyBoardFontViewController) {
        _keyBoardFontViewController = [[EXKeyBoardFontViewController alloc]init];
    }
    return _keyBoardFontViewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 * 导入HTML格式
 
 @return return value description
 */
- (NSString *)exportHTML {
    NSString *title = [NSString stringWithFormat:@"<h1 align=\"center\">%@</h1>", self.textView.titleTextField.text];
    NSString *content = [EXTextHTMLParser HTMLFromAttributedString:self.textView.attributedText];
    return [title stringByAppendingString:content];
}


/**
 * 将图片绑定HTML的Attachment

 @param image image description
 @return return value description
 */
- (NSTextAttachment *)insertImage:(UIImage *)image {
    
    CGFloat width = CGRectGetWidth(self.textView.frame) - (self.textView.textContainerInset.left + self.textView.textContainerInset.right + 12.f);
    NSTextAttachment *textAttachment = [NSTextAttachment attachmentWithImage:image width:width];
    NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"\n"];
    [attributedString insertAttributedString:attachmentString atIndex:0];
    if (_lastSelectedRange.location != 0 &&
        ![[self.textView.text substringWithRange:NSMakeRange(_lastSelectedRange.location - 1, 1)] isEqualToString:@"\n"]) {
        // 上一个字符不为"\n"则图片前添加一个换行 且 不是第一个位置
        [attributedString insertAttributedString:[[NSAttributedString alloc] initWithString:@"\n"] atIndex:0];
    }
    [attributedString addAttributes:self.textView.typingAttributes range:NSMakeRange(0, attributedString.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
    paragraphStyle.paragraphSpacingBefore = 8.f;
    paragraphStyle.paragraphSpacing = 8.f;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];
    [attributedText replaceCharactersInRange:_lastSelectedRange withAttributedString:attributedString];
    self.textView.allowsEditingTextAttributes = YES;
    self.textView.attributedText = attributedText;
    self.textView.allowsEditingTextAttributes = NO;
    return textAttachment;
}


/**
 * 获取所有选中的段落，通过"\n"来判断段落。

 @return return value description
 */
- (NSArray *)rangesOfParagraphForCurrentSelection {
    
    NSRange selection = self.textView.selectedRange;
    NSInteger location;
    NSInteger length;
    
    NSInteger start = 0;
    NSInteger end = selection.location;
    NSRange range = [self.textView.text rangeOfString:@"\n"
                                              options:NSBackwardsSearch
                                                range:NSMakeRange(start, end - start)];
    location = (range.location != NSNotFound) ? range.location + 1 : 0;
    
    start = selection.location + selection.length;
    end = self.textView.text.length;
    range = [self.textView.text rangeOfString:@"\n"
                                      options:0
                                        range:NSMakeRange(start, end - start)];
    length = (range.location != NSNotFound) ? (range.location + 1 - location) : (self.textView.text.length - location);
    
    range = NSMakeRange(location, length);
    NSString *textInRange = [self.textView.text substringWithRange:range];
    NSArray *components = [textInRange componentsSeparatedByString:@"\n"];
    
    NSMutableArray *ranges = [NSMutableArray array];
    for (NSInteger i = 0; i < components.count; i++) {
        NSString *component = components[i];
        if (i == components.count - 1) {
            if (component.length == 0) {
                break;
            }
            else {
                [ranges addObject:[NSValue valueWithRange:NSMakeRange(location, component.length)]];
            }
        }
        else {
            [ranges addObject:[NSValue valueWithRange:NSMakeRange(location, component.length + 1)]];
            location += component.length + 1;
        }
    }
    if (ranges.count == 0) {
        return nil;
    }
    return ranges;
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


