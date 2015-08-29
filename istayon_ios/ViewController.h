//
//  ViewController.h
//  istayon_ios
//
//  Created by Austin Valeske on 8/24/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DataManager.h"
#import "Communicator.h"

@interface ViewController : UIViewController <DataManagerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

