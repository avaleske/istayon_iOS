//
//  ViewController.m
//  istayon_ios
//
//  Created by Austin Valeske on 8/24/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSDictionary *_data;
    DataManager *_manager;
    UIRefreshControl * __weak _refreshControl;
}

@synthesize scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];

    _manager = [[DataManager alloc] init];
    _manager.communicator = [[Communicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to refresh" ];
    [refreshControl addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
    
    _refreshControl = refreshControl;
    
    [self.scrollView insertSubview:refreshControl atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshView: (UIRefreshControl *) refresh {
    [_manager fetchLikeData];
    //[refresh endRefreshing];

}

#pragma mark - DataManagerDelegate

- (void)didRecieveLikeData:(NSDictionary *)data {
    
    [_refreshControl endRefreshing];
}

- (void)fetchingDataFailedWithError:(NSError *)error {
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
    [_refreshControl endRefreshing];
}

@end
