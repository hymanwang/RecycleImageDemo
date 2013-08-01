//
//  ViewController.m
//  RecycleImage
//
//  Created by Hyman Wang on 8/1/13.
//  Copyright (c) 2013 Hyman Wang. All rights reserved.
//

#import "ViewController.h"
#import "CycleScrollView.h"

@interface ViewController ()<CycleScrollViewDelegate>

@property (strong, nonatomic) NSArray *imageArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    self.imageArray = [NSArray arrayWithObjects:
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"5" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"6" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"7" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"8" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"9" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"10" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"11" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"12" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"13" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"14" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"15" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"16" ofType:@"jpg"]],
//                       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"20" ofType:@"jpg"]],
//                       nil];
    self.imageArray = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"20", nil];
    CycleScrollView *scrollView = [[CycleScrollView alloc] initWithFrame:self.view.frame images:self.imageArray];
    scrollView.cycleDelegate = self;
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cycleScrollViewDidSelectViewAtIndex:(NSNumber *)index
{
    NSLog(@"%i", [index integerValue]);
}

@end
