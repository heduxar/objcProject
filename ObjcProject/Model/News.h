//
//  News.h
//  ObjcProject
//
//  Created by Юрий Султанов on 07.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject

@property (nonatomic, strong) NSString *sourceName;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *newsText;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSDate *publishedAt;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
