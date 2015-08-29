//
//  Communicator.m
//  istayon_ios
//
//  Created by Austin Valeske on 8/28/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import "Communicator.h"

@implementation Communicator

- (void)fetchLikeDataJson{
    NSURL *url = [[NSURL alloc] initWithString:@"http://localhost:5000/api/all"];
    NSLog(@"%@", url);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url]
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if (error) {
                                   [self.delegate fetchingDataFailedWithError:error];
                               } else {
                                   [self.delegate receivedJSON:data];
                               }
                           }];
}

@end
