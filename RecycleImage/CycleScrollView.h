//
//  CycleScrollView.h
//  RecycleImage
//
//  Created by Hyman Wang on 8/1/13.
//  Copyright (c) 2013 Hyman Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CycleScrollViewDelegate;
@interface CycleScrollView : UIScrollView<UIScrollViewDelegate>
{
    NSArray *_imageArray;
    NSInteger _currentImageIndex;
}

@property (assign, nonatomic) id<CycleScrollViewDelegate> cycleDelegate;

- (id)initWithFrame:(CGRect)frame images:(NSArray *)imageArray;

@end

@protocol CycleScrollViewDelegate <NSObject>

- (void)cycleScrollViewDidSelectViewAtIndex:(NSNumber *)index;

@end