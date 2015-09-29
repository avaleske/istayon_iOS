//
//  LikeData.h
//  istayon_ios
//
//  Created by Austin Valeske on 8/27/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LikeData : NSObject

@property NSArray *timestamps;
@property NSArray *counts;
@property NSArray *ticks;
@property NSNumber *xMin;
@property NSString *lastLikedPhrase;
@property NSNumber *totalCount;
@property NSString *message;
@property NSString *word;
@property NSString *austinAvatarUrl;
@property NSString *jenAvatarUrl;

- (LikeData *)initWithJson:(NSDictionary *)dict;
- (LikeData *)initWithTestData;
@end
