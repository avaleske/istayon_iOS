//
//  DataManagerDelegate.h
//  istayon_ios
//
//  Created by Austin Valeske on 8/27/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LikeData.h"


@protocol DataManagerDelegate
- (void) didRecieveLikeData:(LikeData *)data;
- (void) fetchingDataFailedWithError:(NSError *)error;
@end
