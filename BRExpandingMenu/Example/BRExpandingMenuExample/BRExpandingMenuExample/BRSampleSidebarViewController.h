//
//  BRSampleSidebarViewController.h
//  BRExpandingMenuExample
//
//  Created by Bradley Ringel on 4/2/14.
//  Copyright (c) 2014 Bradley Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRExpandingViewController.h"

@interface BRSampleSidebarViewController : UIViewController <BRSidebarViewController>

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end
