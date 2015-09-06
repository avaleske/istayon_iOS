//
//  DataManager.h
//  istayon_ios
//
//  Created by Austin Valeske on 8/27/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataManagerDelegate.h"
#import "CommunicatorDelegate.h"
#import "LikeData.h"

@class Communicator;

@interface DataManager : NSObject <CommunicatorDelegate>
@property (weak) id<DataManagerDelegate> delegate;
@property Communicator *communicator;

- (void)fetchLikeData;
@end
