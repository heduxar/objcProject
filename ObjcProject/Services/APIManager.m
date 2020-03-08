//
//  APIManager.m
//  ObjcProject
//
//  Created by Юрий Султанов on 07.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import "APIManager.h"
#import <UIKit/UIApplication.h>

#define API_TOKEN @"82deadcb72aa41cebe5f530cef1817a2"
#define API_URL_SCHME @"https"
#define API_URL_HOST @"newsapi.org"
#define API_URL_PATH @"/v2/everything"
#define API_LANGUAGE @"ru"
#define API_SORT_METHOD @"publishedAt"

@implementation APIManager

+(instancetype)sharedInstance {
    static APIManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[APIManager alloc] init];
    });
    return instance;
};

- (NSURL *) createURL: (NSString *) keywords {
    NSURLComponents *components = [[NSURLComponents alloc] init];
    [components setScheme:[NSString stringWithFormat:@"%@", API_URL_SCHME]];
    [components setHost:[NSString stringWithFormat:@"%@", API_URL_HOST]];
    [components setPath:[NSString stringWithFormat:@"%@", API_URL_PATH]];
    
    NSURLQueryItem *country = [[NSURLQueryItem alloc] initWithName:@"language" value:[NSString stringWithFormat:@"%@", API_LANGUAGE]];
    NSURLQueryItem *search = [[NSURLQueryItem alloc] initWithName:@"q" value:[NSString stringWithFormat:@"%@", keywords]];
    NSURLQueryItem *sort = [[NSURLQueryItem alloc] initWithName:@"sortBy" value:[NSString stringWithFormat:@"%@", API_SORT_METHOD]];
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:@"apiKey" value:[NSString stringWithFormat:@"%@", API_TOKEN]];
    [components setQueryItems:[NSArray arrayWithObjects:country,search,sort,apiKey, nil]];
    
    return [components URL];
}

-(void)newsForRequest: (NSString * _Nullable)keywords withComplition:(void (^)(NSMutableArray * _Nonnull))complition {
    [self createURL:keywords];
    [self load:[self createURL:keywords] withCompletion:^(id  _Nullable result) {
        NSDictionary *json = result;
        NSDictionary *news = [json objectForKey:@"articles"];
        if (news) {
            NSMutableArray *complitionNews = [NSMutableArray new];
            for (NSDictionary *post in news) {
                News *somePost = [[News alloc] initWithDictionary:post];
                [complitionNews addObject:somePost];
            };
            if (complitionNews) {
                for (News *news in complitionNews) {
                    NSLog(@"%@", [NSString stringWithFormat:@"%@",news.title]);
                }
                dispatch_async(dispatch_get_main_queue(), ^ {
                    complition(complitionNews);
                });
            };
        }
    }];
};

- (void)load:(NSURL *)urlString withCompletion:(void (^)(id _Nullable result))completion {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
    [[[NSURLSession sharedSession] dataTaskWithURL:urlString completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
        completion([NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]);
    }] resume] ;
};


@end
