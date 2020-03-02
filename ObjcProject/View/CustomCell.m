//
//  CustomCell.m
//  ObjcProject
//
//  Created by Юрий Султанов on 02.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(5.0,
                                                               5.0,
                                                               50.0,
                                                               50.0)];
        _image.contentMode = UIViewContentModeScaleAspectFill;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_image.frame.origin.x + _image.frame.size.width + 10, 5.0, [UIScreen mainScreen].bounds.size.width/2,30.0)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:16 weight:(UIFontWeightBold)];
        
        _secondaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(_image.frame.origin.x + _image.frame.size.width + 10, _titleLabel.frame.origin.y + _titleLabel.frame.size.height, [UIScreen mainScreen].bounds.size.width/2,20.0)];
        _secondaryLabel.textAlignment = NSTextAlignmentLeft;
        _secondaryLabel.font = [UIFont systemFontOfSize:12 weight:(UIFontWeightLight)];
        [self.contentView addSubview:_image];
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_secondaryLabel];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
