//
//  News.m
//  ObjcProject
//
//  Created by Юрий Султанов on 07.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import "News.h"

@implementation News

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        NSDictionary *source = [dictionary objectForKey:@"source"];
        _sourceName = [source valueForKey:@"name"];
        _author = [dictionary valueForKey:@"author"];
        _title = [dictionary valueForKey:@"title"];
        _newsText = [dictionary valueForKey:@"description"];
        _imageUrl = [dictionary valueForKey:@"urlToImage"];
        _url = [dictionary valueForKey:@"url"];
        _publishedAt = dateFromString([dictionary valueForKey:@"publishedAt"]);
    }
    return self;
}
NSDate *dateFromString(NSString *dateString) {
    if (!dateString) { return  nil; }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *correctStringDate = [dateString stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    correctStringDate = [correctStringDate stringByReplacingOccurrencesOfString:@"Z" withString:@" "];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [dateFormatter dateFromString: correctStringDate];
}


@end
