//
//  Communicator.h
//  istayon_ios
//
//  Created by Austin Valeske on 8/28/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CommunicatorDelegate.h"

@interface Communicator : NSObject
@property (weak) id<CommunicatorDelegate> delegate;

- (void) fetchLikeDataJson;
@end
