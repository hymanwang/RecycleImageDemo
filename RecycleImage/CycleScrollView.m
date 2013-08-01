//
//  CycleScrollView.m
//  RecycleImage
//
//  Created by Hyman Wang on 8/1/13.
//  Copyright (c) 2013 Hyman Wang. All rights reserved.
//

#import "CycleScrollView.h"

@implementation CycleScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame images:(NSArray *)imageArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageArray = imageArray;
        _currentImageIndex = 0;
        self.frame = frame;
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = self;
        self.contentSize = CGSizeMake(frame.size.width * 3, frame.size.height);
        [self reloadImageViews];
    }
    return self;
}

- (void)dealloc
{
    self.delegate = nil;
}

- (void)reloadImageViews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSArray *currentImages = [self getImagesToShowWithIndex:_currentImageIndex];
    for (int i = 0; i < currentImages.count; i++) {
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[currentImages objectAtIndex:i] ofType:@"jpg"]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [imageView setFrame:CGRectMake(i * self.frame.size.width, 0.0, self.frame.size.width, self.frame.size.height)];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)]];
        [self addSubview:imageView];
    }
    self.contentOffset = CGPointMake(self.frame.size.width, 0.0);
}

- (NSArray *)getImagesToShowWithIndex:(NSInteger)index
{
    NSInteger previous = _currentImageIndex == 0?_imageArray.count - 1:_currentImageIndex - 1;
    NSInteger next = (_currentImageIndex + 1) % _imageArray.count;//(index == _imageArray.count - 1?0:index + 1);
    NSMutableArray *loadedImages = [NSMutableArray arrayWithCapacity:3];
    [loadedImages addObject:[_imageArray objectAtIndex:previous]];
    [loadedImages addObject:[_imageArray objectAtIndex:_currentImageIndex]];
    [loadedImages addObject:[_imageArray objectAtIndex:next]];
    return loadedImages;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x <= 0) {
        _currentImageIndex = (_currentImageIndex - 1) < 0? _imageArray.count - 1:(_currentImageIndex - 1) % _imageArray.count;
        [self reloadImageViews];
    }
    if (scrollView.contentOffset.x >= scrollView.frame.size.width * 2) {
        _currentImageIndex = (_currentImageIndex + 1) % _imageArray.count;
        [self reloadImageViews];
    }
}

- (void)handleTap
{
    if ([self.cycleDelegate respondsToSelector:@selector(cycleScrollViewDidSelectViewAtIndex:)]) {
        [self.cycleDelegate performSelector:@selector(cycleScrollViewDidSelectViewAtIndex:) withObject:[NSNumber numberWithInteger:_currentImageIndex]];
    }
}

@end
