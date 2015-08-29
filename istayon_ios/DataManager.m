//
//  DataManager.m
//  istayon_ios
//
//  Created by Austin Valeske on 8/27/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import "DataManager.h"
#import "Communicator.h"

@implementation DataManager

- (void)fetchLikeData{
    [self.communicator fetchLikeDataJson];

}

#pragma mark - CommunicatorDelegate
    
- (void)receivedJSON:(NSData *)data {
    NSError *error = nil;
    NSLog(@"here");
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&error];
    if (jsonDict) {
        NSLog(@"%@", [jsonDict valueForKey:@"message"]);
        [self.delegate didRecieveLikeData:jsonDict];
    } else {
        [self.delegate fetchingDataFailedWithError:error];
    }
}

- (void)fetchingDataFailedWithError:(NSError *)error {
    NSLog(@"or here");
    [self.delegate fetchingDataFailedWithError:error];
}

@end
