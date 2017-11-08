//
//  EX_PracticeCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/9.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_PracticeCell.h"

@interface EX_PracticeCell ()
@property(nonatomic, strong)UIButton *foldButton;   //折叠
@property(nonatomic, strong)UILabel  *headerLabel;  //标题
@property(nonatomic, strong)UILabel  *pageLabel;    //分页
@property(nonatomic, strong)UIButton *downloadButton; //下载按钮
@property(nonatomic, strong)UIProgressView   *progressView; //进度
@end
@implementation EX_PracticeCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EX_PracticeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EX_PracticeCell class])];
    if (!cell) {
        cell = [[EX_PracticeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EX_PracticeCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.headerLabel = [UILabel SinglelabelWithTitle:@"第一篇：桥梁工程原材料,构件等" color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] alignment:NSTextAlignmentLeft];
        self.pageLabel   = [UILabel SinglelabelWithTitle:@"0/33" color:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:12.0] alignment:NSTextAlignmentRight];
        self.foldButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.foldButton.titleLabel setFont:FontPingFangSC(10.0)];
        self.foldButton.layer.masksToBounds = YES;
        self.foldButton.layer.borderWidth = 1.0f;
        self.foldButton.layer.borderColor = [UIColor brownColor].CGColor;
        self.foldButton.layer.cornerRadius = 5.0f;
        [self.foldButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        self.foldButton.contentEdgeInsets =  UIEdgeInsetsMake(5, 5, 5, 5);
        [self.foldButton setTitle:@"折叠" forState:UIControlStateNormal];
        self.foldButton.tag = 100;
        [self.foldButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        self.downloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.downloadButton.titleLabel setFont:FontPingFangSC(8.0)];
        self.downloadButton.layer.masksToBounds = YES;
        self.downloadButton.layer.borderWidth = 1.0f;
        self.downloadButton.layer.borderColor = [UIColor brownColor].CGColor;
        self.downloadButton.layer.cornerRadius = 5.0f;
        [self.downloadButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        self.downloadButton.contentEdgeInsets =  UIEdgeInsetsMake(5, 5, 5, 5);
        [self.downloadButton setTitle:@"Start" forState:UIControlStateNormal];
        self.downloadButton.tag =101;
        [self.downloadButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        self.progressView = [[UIProgressView alloc]init];
        self.progressView.backgroundColor =[UIColor colorWithRed:237/255.0 green: 237/255.0 blue:237/255.0 alpha:.2];
        [self.contentView addSubview:self.foldButton];
        [self.contentView addSubview:self.headerLabel];
        [self.contentView addSubview:self.pageLabel];
        [self.contentView addSubview:self.downloadButton];
        [self.contentView addSubview:self.progressView];
        
        [_foldButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10.0);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.and.height.mas_equalTo(30.0);
        }];
        
        [_headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10.0);
            make.left.mas_equalTo(self.foldButton.mas_right).mas_offset(20.0);
            make.width.mas_equalTo(200.0);
        }];
        
        [_pageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.headerLabel.mas_centerY);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10.0);
        }];
        
        [_downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10.0);
            make.top.mas_equalTo(self.pageLabel.mas_bottom).mas_offset(10.0);
            make.width.and.height.mas_equalTo(30.0);
        }];
        
        [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headerLabel.mas_left);
            make.centerY.mas_equalTo(self.downloadButton.mas_centerY);
            make.height.mas_equalTo(5.0);
            make.width.mas_equalTo(220.0);
        }];
        
    }
    return self;
}

- (void)setUrl:(NSString *)url {
    _url = url;

     MCDownloadReceipt *receipt = [[MCDownloader sharedDownloader] downloadReceiptForURLString:url];
    self.progressView.progress = 0;
    self.progressView.progress = receipt.progress.fractionCompleted;
    if (receipt.state == MCDownloadStateDownloading || receipt.state == MCDownloadStateWillResume) {
        [self.downloadButton setTitle:@"Stop" forState:UIControlStateNormal];
    }else if (receipt.state == MCDownloadStateCompleted) {
        [self.downloadButton setTitle:@"Play" forState:UIControlStateNormal];
    }else {
        [self.downloadButton setTitle:@"Start" forState:UIControlStateNormal];
    }
    
    __weak typeof(receipt) weakReceipt = receipt;
    receipt.downloaderProgressBlock = ^(NSInteger receivedSize, NSInteger expectedSize, NSInteger speed, NSURL * _Nullable targetURL) {
        __strong typeof(weakReceipt) strongReceipt = weakReceipt;
        if ([targetURL.absoluteString isEqualToString:self.url]) {
            [self.downloadButton setTitle:@"Stop" forState:UIControlStateNormal];
             self.progressView.progress = (receivedSize/1024.0/1024) / (expectedSize/1024.0/1024);
            NSLog(@"下载字节:%@", [NSString stringWithFormat:@"%0.1fm/%0.1fm", receivedSize/1024.0/1024,expectedSize/1024.0/1024]);
            NSLog(@"下载速度：%@", [NSString stringWithFormat:@"%@/s", strongReceipt.speed ?: @"0"]);
        }
        
    };
    
    receipt.downloaderCompletedBlock = ^(MCDownloadReceipt *receipt, NSError * _Nullable error, BOOL finished) {
        if (error) {
            [self.downloadButton setTitle:@"Start" forState:UIControlStateNormal];
        }else {
            [self.downloadButton setTitle:@"Play" forState:UIControlStateNormal];
        }
    };
    
}

-(void)dothings:(UIButton *)sender{
    switch (sender.tag - 100) {
        case 0:
        {
            NSLog(@"折叠");
        }
            break;
        case 1:
        {
            MCDownloadReceipt *receipt = [[MCDownloader sharedDownloader] downloadReceiptForURLString:self.url];
            if (receipt.state == MCDownloadStateDownloading || receipt.state == MCDownloadStateWillResume) {
                
                [[MCDownloader sharedDownloader] cancel:receipt completed:^{
                    [self.downloadButton setTitle:@"Start" forState:UIControlStateNormal];
                }];
            }else if (receipt.state == MCDownloadStateCompleted) {
                if (self.xm_delegate&&[self.xm_delegate respondsToSelector:@selector(XM_ClickButtonTableViewCell:selectIndex:)]) {
                    [self.xm_delegate XM_ClickButtonTableViewCell:self selectIndex:sender.tag];
                }
                NSLog(@"下载完成");
            }else {
                [self.downloadButton setTitle:@"Stop" forState:UIControlStateNormal];
                [self download];
            }
        }
        default:
            break;
    }
}


-(void)download{
    [[MCDownloader sharedDownloader] downloadDataWithURL:[NSURL URLWithString:self.url] progress:^(NSInteger receivedSize, NSInteger expectedSize, NSInteger speed, NSURL * _Nullable targetURL) {
        
    } completed:^(MCDownloadReceipt *receipt, NSError * _Nullable error, BOOL finished) {
      
    }];
}

- (void)setFrame:(CGRect)frame{
    
    frame.origin.x = 10.0;
    frame.size.width -= 10.0 * 2;
    
    frame.origin.y += 10.0;
    frame.size.height -= 10.0;
    
    [super setFrame:frame];
}

@end

