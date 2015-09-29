//
//  ViewController.m
//  istayon_ios
//
//  Created by Austin Valeske on 8/24/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *Message;
@property (weak, nonatomic) IBOutlet UILabel *Details;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet BEMSimpleLineGraphView *chartView;
@property (weak, nonatomic) UIRefreshControl *refreshControl;


@end

@implementation ViewController {
    LikeData *likeData;
    DataManager *_manager;
    
}

@synthesize scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];

    _manager = [[DataManager alloc] init];
    _manager.communicator = [[Communicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
    _refreshControl = refreshControl;
    
    [self.scrollView setContentInset: UIEdgeInsetsMake(10, 0, 0, 0)];
    [self.scrollView insertSubview:refreshControl atIndex:0];
    
    // graph settings
    self.chartView.enableBezierCurve = YES;
    self.chartView.enableYAxisLabel = YES;
    self.chartView.enableXAxisLabel = YES;
    self.chartView.enableReferenceAxisFrame = YES;
    self.chartView.animationGraphStyle = BEMLineAnimationFade;}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshView: (UIRefreshControl *) refresh {
    [_manager fetchLikeData];
    //[refresh endRefreshing];

}

#pragma mark - BEMSimpleLineGraphDelegate

//- (CGFloat)minValueForLineGraph:(BEMSimpleLineGraphView *)graph{
//    return 1.0;
//}

#pragma mark - BEMSompleLineGraphDataSource

- (NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph{
    return likeData.counts.count;
}


- (CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index{
    return [likeData.counts[index] floatValue];
}

- (nullable NSString *)lineGraph:(nonnull BEMSimpleLineGraphView *)graph labelOnXAxisForIndex:(NSInteger)index{
    if(index % 12 == 0) return [NSString stringWithFormat:@"%@  ", @(2 - (index / 12))];
    else return @"";
}

#pragma mark - DataManagerDelegate

- (void)didRecieveLikeData:(LikeData *)data {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.Message setText:data.message];
        [self.Details setText: [NSString stringWithFormat:@"\u2022 %@\n\u2022 She's liked %@ things.",
                                data.lastLikedPhrase,
                                data.totalCount]];
        self->likeData = data;
        
        [self.view setNeedsDisplay];
        [self.chartView reloadGraph];
        [_refreshControl endRefreshing];
    });
}

- (void)fetchingDataFailedWithError:(NSError *)error {
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
    [_refreshControl endRefreshing];
}

@end
