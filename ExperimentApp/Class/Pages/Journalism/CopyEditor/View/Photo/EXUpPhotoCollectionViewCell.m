//
//  EXUpPhotoCollectionViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/6.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXUpPhotoCollectionViewCell.h"
@interface EXUpPhotoCollectionViewCell ()
@property(nonatomic,strong)UIImageView *selectImageView;
@property(nonatomic,strong)UIButton *videoButton;
@property(nonatomic,strong)UIImageView *photoImageView;
@end
@implementation EXUpPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.photoImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.photoImageView.clipsToBounds = YES;
        [self addSubview:self.photoImageView];
        self.selectImageView = [[UIImageView alloc]init];
        self.selectImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.selectImageView.image = [UIImage imageNamed:@"oval_hl"];
        self.selectImageView.hidden = YES;
        self.selectImageView.clipsToBounds = YES;
        [self addSubview:self.selectImageView];
        self.videoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.videoButton setImage:[UIImage imageNamed:PlaceholderImageName] forState:UIControlStateNormal];
        self.videoButton.hidden = YES;
        self.videoButton.clipsToBounds = YES;
        self.videoButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.mas_equalTo(self.photoImageView).mas_offset(-Number(3));
            make.width.and.height.mas_equalTo(Number(20));
        }];
        [self.videoButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.selectImageView.hidden = !selected;
}

@end
