//
//  CommunicatorDelegate.h
//  istayon_ios
//
//  Created by Austin Valeske on 8/28/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommunicatorDelegate <NSObject>
- (void)receivedJSON:(NSData *)data;
- (void)fetchingDataFailedWithError:(NSError *)error;
@end
