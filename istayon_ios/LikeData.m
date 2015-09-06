//
//  LikeData.m
//  istayon_ios
//
//  Created by Austin Valeske on 8/27/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import "LikeData.h"

@implementation LikeData

- (LikeData *)initWithJson:(NSDictionary *)dict
{
    
    self.counts = [dict valueForKey:@"counts"];
    self.timestamps = [dict valueForKey:@"timestamps"];
    self.lastLikedPhrase = [dict valueForKey:@"last_liked"];
    self.totalCount = [dict valueForKey:@"count"];
    self.message = [dict valueForKey:@"message"];
    
    return self;
}

- (LikeData *)initWithTestData
{
    
    self.counts = @[@0, @0, @0, @2, @5, @0, @1, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @3, @0, @0, @1, @0];
    self.timestamps = @[@1440716400, @1440716700, @1440717000, @1440717300, @1440717600, @1440717900, @1440718200, @1440718500, @1440718800, @1440719100, @1440719400, @1440719700, @1440720000, @1440720300, @1440720600, @1440720900, @1440721200, @1440721500, @1440721800, @1440722100, @1440722400, @1440722700, @1440723000, @1440723300, @1440723600, @1440723648];
    self.lastLikedPhrase = @"It's been some time since she liked something";
    self.totalCount = @13013;
    self.message = @"Yep, Taylor's online! Look this test message is so long it has to wrap.";
    
    return self;
}

@end
