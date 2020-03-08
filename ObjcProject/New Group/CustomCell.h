//
//  CustomCell.h
//  ObjcProject
//
//  Created by Юрий Султанов on 02.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomCell : UITableViewCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UIImageView *image;

@property (nonatomic, strong) News *news;
- (void)setNews:(News *)news;

@end

NS_ASSUME_NONNULL_END
