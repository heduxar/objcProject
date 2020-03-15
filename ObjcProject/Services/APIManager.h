//
//  APIManager.h
//  ObjcProject
//
//  Created by Юрий Султанов on 07.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import "News.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

+ (instancetype)sharedInstance;
- (void)newsForRequest: (NSString * _Nullable)keywords withComplition:(void (^)(NSMutableArray * _Nonnull newsArray))complition;

@end

NS_ASSUME_NONNULL_END
