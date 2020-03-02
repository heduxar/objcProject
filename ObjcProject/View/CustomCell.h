//
//  CustomCell.h
//  ObjcProject
//
//  Created by Юрий Султанов on 02.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCell : UITableViewCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *secondaryLabel;
@property (nonatomic,strong) UIImageView *image;

@end

NS_ASSUME_NONNULL_END
