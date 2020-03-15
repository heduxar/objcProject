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
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:16 weight:(UIFontWeightSemibold)];
        _titleLabel.numberOfLines = 2;
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_titleLabel];
        NSLayoutConstraint * titleHeight = [NSLayoutConstraint
                                            constraintWithItem:_titleLabel
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                            toItem:nil
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:1.0
                                            constant:20.0];

        NSLayoutConstraint * titleWidth = [NSLayoutConstraint
                                           constraintWithItem:_titleLabel
                                           attribute:NSLayoutAttributeWidth
                                           relatedBy:NSLayoutRelationLessThanOrEqual
                                           toItem:self.layoutMarginsGuide
                                           attribute:NSLayoutAttributeWidth
                                           multiplier:1.0
                                           constant:0.0];

        NSLayoutConstraint * titleLeading = [NSLayoutConstraint
                                             constraintWithItem:_titleLabel
                                             attribute:NSLayoutAttributeLeft
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:self.layoutMarginsGuide
                                             attribute:NSLayoutAttributeLeft
                                             multiplier:1.0
                                             constant:16.0];

        NSLayoutConstraint * titleTrailing = [NSLayoutConstraint
                                              constraintWithItem:_titleLabel
                                              attribute:NSLayoutAttributeRight
                                              relatedBy:NSLayoutRelationEqual
                                              toItem:self.layoutMarginsGuide
                                              attribute:NSLayoutAttributeRight
                                              multiplier:1.0
                                              constant:0.0];

        NSLayoutConstraint * titleToTop = [NSLayoutConstraint
                                           constraintWithItem:_titleLabel
                                           attribute:NSLayoutAttributeTop
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.layoutMarginsGuide
                                           attribute:NSLayoutAttributeTop
                                           multiplier:1.0
                                           constant:0.0];
        
        _image = [[UIImageView alloc] initWithFrame:CGRectZero];
        _image.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_image];
        _image.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * imageHeight = [NSLayoutConstraint
                                            constraintWithItem:_image
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:nil
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:1.0
                                            constant:104.0];

        NSLayoutConstraint * imageWidth =[NSLayoutConstraint
                                          constraintWithItem:_image
                                          attribute:NSLayoutAttributeWidth
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:nil
                                          attribute:NSLayoutAttributeWidth
                                          multiplier:1.0
                                          constant:104.0];

        NSLayoutConstraint * imageToTop =[NSLayoutConstraint
                                          constraintWithItem:_image
                                          attribute:NSLayoutAttributeTop
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:_titleLabel
                                          attribute:NSLayoutAttributeBottom
                                          multiplier:1.0
                                          constant:4.0];

        NSLayoutConstraint * imageRight =[NSLayoutConstraint
                                          constraintWithItem:_image
                                          attribute:NSLayoutAttributeLeft
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.layoutMarginsGuide
                                          attribute:NSLayoutAttributeLeft
                                          multiplier:1.0
                                          constant:0.0];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _dateLabel.textAlignment = NSTextAlignmentLeft;
        _dateLabel.font = [UIFont systemFontOfSize:10 weight:(UIFontWeightThin)];
        _dateLabel.numberOfLines = 1;
        _dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_dateLabel];
        
        NSLayoutConstraint * dateToTitle = [NSLayoutConstraint
                                            constraintWithItem:_dateLabel
                                            attribute:NSLayoutAttributeTop
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:_titleLabel
                                            attribute:NSLayoutAttributeBottom
                                            multiplier:1.0
                                            constant:4.0];

        NSLayoutConstraint * dateLeading = [NSLayoutConstraint
                                            constraintWithItem:_dateLabel
                                            attribute:NSLayoutAttributeLeft
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:_image
                                            attribute:NSLayoutAttributeRight
                                            multiplier:1.0
                                            constant:4.0];

        NSLayoutConstraint * dateTrailing = [NSLayoutConstraint
                                            constraintWithItem:_dateLabel
                                            attribute:NSLayoutAttributeRight
                                            relatedBy:NSLayoutRelationLessThanOrEqual
                                            toItem:_titleLabel
                                            attribute:NSLayoutAttributeRight
                                            multiplier:1.0
                                            constant:0.0];
        NSLayoutConstraint * dateHeight = [NSLayoutConstraint
                                          constraintWithItem:_dateLabel
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationGreaterThanOrEqual
                                          toItem:nil
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1.0
                                          constant:0.0];

        _textView = [[UITextView alloc] initWithFrame:CGRectZero];
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightLight];
        _textView.selectable = NO;
        [_textView setUserInteractionEnabled:NO];
        _textView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_textView];
        
        NSLayoutConstraint * textViewHeight = [NSLayoutConstraint
                                               constraintWithItem:_textView
                                               attribute:NSLayoutAttributeHeight
                                               relatedBy:NSLayoutRelationGreaterThanOrEqual
                                               toItem:nil
                                               attribute:NSLayoutAttributeHeight
                                               multiplier:1.0
                                               constant:20.0];
        
        NSLayoutConstraint * textViewToDate = [NSLayoutConstraint
                                               constraintWithItem:_textView
                                               attribute:NSLayoutAttributeTop
                                               relatedBy:NSLayoutRelationEqual
                                               toItem:_dateLabel
                                               attribute:NSLayoutAttributeBottom
                                               multiplier:1.0
                                               constant:0.0];
        
        NSLayoutConstraint * textViewLeading = [NSLayoutConstraint
                                                constraintWithItem:_textView
                                                attribute:NSLayoutAttributeLeft
                                                relatedBy:NSLayoutRelationEqual
                                                toItem:_image
                                                attribute:NSLayoutAttributeRight
                                                multiplier:1.0
                                                constant:4.0];
        
        NSLayoutConstraint * textViewTrailing = [NSLayoutConstraint
                                                 constraintWithItem:_textView
                                                 attribute:NSLayoutAttributeRight
                                                 relatedBy:NSLayoutRelationLessThanOrEqual
                                                 toItem:self.layoutMarginsGuide
                                                 attribute:NSLayoutAttributeRight
                                                 multiplier:1.0
                                                 constant:0.0];
        
        NSLayoutConstraint * textViewToBottom = [NSLayoutConstraint
                                                 constraintWithItem:_textView
                                                 attribute:NSLayoutAttributeBottom
                                                 relatedBy:NSLayoutRelationLessThanOrEqual
                                                 toItem:self.layoutMarginsGuide
                                                 attribute:NSLayoutAttributeBottom
                                                 multiplier:1.0
                                                 constant:0.0];
        [self addConstraints:@[imageHeight, imageWidth, imageToTop, imageRight,
                               titleToTop, titleLeading, titleTrailing, titleHeight, titleWidth,
                               dateToTitle, dateLeading, dateTrailing, dateHeight,
                               textViewHeight, textViewToDate,textViewLeading,textViewTrailing,textViewToBottom]];
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

- (void)setNews:(News *)news {
    _news = news;
    
    _image.image = [UIImage imageNamed:@"news"];
    
    _titleLabel.text = news.title;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm dd-MM-yyyy";
    _dateLabel.text = [dateFormatter stringFromDate:news.publishedAt];
    
    _textView.text = news.newsText;
//    NSURL *urlLogo = AirlineLogo(ticket.airline);
//    [_airlineLogoView yy_setImageWithURL:urlLogo options:YYWebImageOptionSetImageWithFadeAnimation];
}


@end
