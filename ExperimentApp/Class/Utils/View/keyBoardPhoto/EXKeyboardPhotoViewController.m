//
//  EXKeyboardPhotoViewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXKeyboardPhotoViewController.h"
#import "EXPhotoPreviewViewController.h"
#import "EXKeyboardPhotoCollectionViewCell.h"
#import "EXPhotoPreviewViewController.h"
@import Photos;
@interface EXKeyboardPhotoViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, PHPhotoLibraryChangeObserver, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(nonatomic,strong)UICollectionView *photoCollectionView;
@property(nonatomic,strong)EXPhotoPreviewViewController *previewController; //预览
@property(nonatomic, strong) PHFetchResult *photosResult;
@property(nonatomic, strong) NSMutableDictionary *photos;
@property (nonatomic,strong) RewriteButton *takePhotoPreview;///拍照/预览
@property (nonatomic,strong) RewriteButton *photoSend;   //相册/发送
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;
@property (nonatomic,strong) UIView  *bottomView;   ///底部视图
@property (nonatomic, assign) BOOL selecting;
@end
@implementation EXKeyboardPhotoViewController

static CGFloat const Height = 60.f;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithBottomView];
    [self initWithCollectionView];
    [self initWithPHPhotoLibrary];
    self.selecting = NO;
}

/**
 * 初始化CollectionView
 */
-(void)initWithCollectionView{
    [self.view addSubview:self.photoCollectionView];
    [self.photoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.bottomView.mas_top);
    }];
    [self.photoCollectionView registerClass:[EXKeyboardPhotoCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([EXKeyboardPhotoCollectionViewCell class])];
}

/**
 * 初始化相册 获取相册的图片
 */
-(void)initWithPHPhotoLibrary{
    PHFetchOptions *nearestPhotosOptions = [[PHFetchOptions alloc] init];
    nearestPhotosOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    nearestPhotosOptions.fetchLimit = 30;
    self.photosResult = [PHAsset fetchAssetsWithOptions:nearestPhotosOptions];
    self.photos = [NSMutableDictionary dictionary];
    [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.photoCollectionView setNeedsLayout];
}
/**
 *  刷新界面
 */
-(void)reload{
    self.selecting = NO;
    self.selectedIndexPath = nil;
    [self.photoCollectionView reloadData];
}

#pragma mark <PHPhotoLibraryChangeObserver>
- (void)photoLibraryDidChange:(PHChange *)changeInstance {
    [self initWithPHPhotoLibrary];
}

#pragma mark <UICollectionViewDelegate>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photosResult.count;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = CGRectGetHeight(self.photoCollectionView.frame);
    return   CGSizeMake(height * 0.8, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return Number(5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return Number(5);
}

- ( UIEdgeInsets )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section {
    //top, left, bottom, right
    return UIEdgeInsetsMake ( Number(5), Number(5) ,Number(5), Number(5));
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EXKeyboardPhotoCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EXKeyboardPhotoCollectionViewCell class]) forIndexPath:indexPath];
    UIImage *image = self.photos[indexPath];
    if (image) {
        cell.photoImageView.image = image;
    }else{
        cell.photoImageView.image = nil;
        PHAsset *asset = self.photosResult[indexPath.item];
        CGSize targetSize = CGSizeMake(200, 200);
        [[PHImageManager defaultManager] requestImageForAsset:asset
                                                   targetSize:targetSize
                                                  contentMode:PHImageContentModeAspectFit
                                                      options:nil
                                                resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                                                    
                                                    self.photos[indexPath] = result;
                                                    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
                                                }];
    }
    cell.selected = ([indexPath isEqual:self.selectedIndexPath]);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath isEqual:self.selectedIndexPath]) {
        self.selectedIndexPath = nil;
        self.selecting = NO;
        [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    }
    else {
        self.selectedIndexPath = indexPath;
        self.selecting = YES;
    }
}

#pragma mark <UIImagePickerControllerDelegate>
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    CGSize targetSize = [UIScreen mainScreen].bounds.size;
    targetSize.width *= 2;
    targetSize.height = targetSize.width * originalImage.size.height / originalImage.size.width;
    
    UIGraphicsBeginImageContext(targetSize);
    [originalImage drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.delegate xm_KeyboardPhotoController:self initWithSendImage:scaledImage];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

/**
 选中图片Button文字改变
 
 @param selecting selecting description
 */
-(void)setSelecting:(BOOL)selecting{
    _selecting = selecting;
    if (selecting){
        [self.takePhotoPreview setImage:[UIImage imageNamed:@"photo_preview_icon"] forState:UIControlStateNormal];
        [self.takePhotoPreview setTitle:@"预览" forState:UIControlStateNormal];
        [self.photoSend setImage:[UIImage imageNamed:@"photo_send_icon"] forState:UIControlStateNormal];
        [self.photoSend setTitle:@"发送" forState:UIControlStateNormal];
    }else {
        [self.takePhotoPreview setImage:[UIImage imageNamed:@"photo_take_icon"] forState:UIControlStateNormal];
        [self.takePhotoPreview setTitle:@"拍照" forState:UIControlStateNormal];
        [self.photoSend setImage:[UIImage imageNamed:@"photo_gallery_icon"] forState:UIControlStateNormal];
        [self.photoSend setTitle:@"相册" forState:UIControlStateNormal];
    }
}


/**
 * 初始化Bottom底部视图
 */
-(void)initWithBottomView{
    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.view.frame) - Height*2, SCREEN_WIDTH, Height*2)];
    [self.view addSubview:self.bottomView];
    self.takePhotoPreview = [RewriteButton buttonWithType:UIButtonTypeCustom];
    [self initWithButton:self.takePhotoPreview withTitle:@"拍照" withImageName:@"photo_take_icon"];
    [self.view addSubview:self.takePhotoPreview];
    self.takePhotoPreview.tag = 100;
    [self.takePhotoPreview addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    self.photoSend = [RewriteButton buttonWithType:UIButtonTypeCustom];
    [self initWithButton:self.photoSend withTitle:@"相册" withImageName:@"photo_gallery_icon"];
    [self.view addSubview:self.photoSend];
    self.photoSend.tag = 101;
    [self.photoSend addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    [self.takePhotoPreview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.bottomView);
        make.height.mas_equalTo(Height);
    }];
    [self.photoSend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.bottomView);
        make.top.mas_equalTo(self.takePhotoPreview.mas_bottom);
        make.height.mas_equalTo(Height);
    }];
}

-(void)dothings:(UIButton *)sender{
    if (_selecting) {       ///选中图片
        switch (sender.tag-100) {
            case 0:
            {
                NSLog(@"预览");
                EXPhotoPreviewViewController *vc = [[EXPhotoPreviewViewController alloc]init];
                if ([self.delegate respondsToSelector:@selector(xm_KeyboardPhotoController:popPreviewController:)]) {
                    [self.delegate xm_KeyboardPhotoController:self popPreviewController:vc];
                }
            }
                break;
            case 1:
            {
                NSLog(@"发送");
                PHAsset *asset = self.photosResult[self.selectedIndexPath.item];
                CGSize targetSize = [UIScreen mainScreen].bounds.size;
                targetSize.width *= 2;
                targetSize.height *= 2;
                [[PHImageManager defaultManager] requestImageForAsset:asset
                                                           targetSize:targetSize
                                                          contentMode:PHImageContentModeAspectFit
                                                              options:nil
                                                        resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                                                            BOOL isDegraded = [info[PHImageResultIsDegradedKey] boolValue];
                                                            if (!isDegraded) {
                                                                if ([self.delegate respondsToSelector:@selector(xm_KeyboardPhotoController:initWithSendImage:)]) {
                                                                    [self.delegate xm_KeyboardPhotoController:self initWithSendImage:result];
                                                                }
                                                            }
                                                        }];
            }
                break;
            default:
                break;
        }
    }else{              ///未选中图片
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        switch (sender.tag - 100) {
            case 0:
            {
                NSLog(@"拍照");
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            }
                break;
            case 1:
            {
                NSLog(@"相册");
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
                break;
            default:
                break;
        }
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}
/**
 设置Button
 
 @param btn btn description
 @param title title description
 @param image image description
 */
-(void)initWithButton:(UIButton *)btn withTitle:(NSString *)title withImageName:(NSString *)image{
    [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    btn.titleLabel.font = FontPingFangSC(Number(14));
    btn.contentMode = UIViewContentModeScaleAspectFill;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateSelected];
    [btn setTitleColor:TitleColor forState:UIControlStateNormal];
    [btn setTitleColor:TitleColor forState:UIControlStateSelected];
    [btn setTitleColor:TitleColor forState:UIControlStateHighlighted];
    [btn setTitleColor:TitleColor forState:UIControlStateDisabled];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateDisabled];
}

/**
 Description
 
 @return return value description
 */
- (UICollectionView *)photoCollectionView{
    if(!_photoCollectionView){
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _photoCollectionView =[[UICollectionView alloc] initWithFrame:CGRectZero
                                                 collectionViewLayout:layout];
        _photoCollectionView.backgroundColor = [UIColor clearColor];
        _photoCollectionView.showsHorizontalScrollIndicator = NO;
        _photoCollectionView.showsVerticalScrollIndicator =NO;
        _photoCollectionView.dataSource = self;
        _photoCollectionView.delegate = self;
        
    }
    return _photoCollectionView;
}

/**
 *  释放 Observer
 */
- (void)dealloc {
    [[PHPhotoLibrary sharedPhotoLibrary] unregisterChangeObserver:self];
}

@end

