//
//  ViewController.m
//  istayon_ios
//
//  Created by Austin Valeske on 8/24/15.
//  Copyright (c) 2015 Austin Valeske. All rights reserved.
//

#import "ViewController.h"
@import Charts.Swift;


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *Message;
@property (weak, nonatomic) IBOutlet UILabel *Details;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet LineChartView *lineChartView;

@property (weak, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation ViewController {
    NSDictionary *_data;
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
    
    _lineChartView.noDataText = @"You need to provide data for the chart.";
    
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

- (void)didRecieveLikeData:(LikeData *)data {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.Message setText:data.message];
        [self.Details setText: [NSString stringWithFormat:@"\u2022 %@\n\u2022 She's liked %@ things.",
                                data.lastLikedPhrase,
                                data.totalCount]];
        [self.view setNeedsDisplay];
        
        // chart
        self.lineChartView.drawGridBackgroundEnabled = NO;
                
        NSMutableArray *yvals = [[NSMutableArray alloc] init];
        for(int i = 0; i<data.counts.count; i++){
            [yvals addObject:[[ChartDataEntry alloc] initWithValue:[data.counts[i] doubleValue] xIndex:i]];
        }
        LineChartDataSet *dataSet = [[LineChartDataSet alloc] initWithYVals:yvals];
        [dataSet setColor:UIColor.blackColor];
        
        LineChartData *chartData = [[LineChartData alloc] initWithXVals:data.timestamps dataSet:dataSet];
        
        [_lineChartView setData:chartData];
        [_refreshControl endRefreshing];
    });
}

- (void)fetchingDataFailedWithError:(NSError *)error {
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
    [_refreshControl endRefreshing];
}

@end
