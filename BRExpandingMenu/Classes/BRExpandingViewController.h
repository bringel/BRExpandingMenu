//
//  BRExpandingViewController.h
//  BRExpandingMenuExample
//
//  Created by Bradley Ringel on 3/30/14.
//  Copyright (c) 2014 Bradley Ringel. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ENUM(NSInteger, BRExpandingMenuState){
    BRExpandingMenuStateOpen,
    BRExpandingMenuStateClosed
};

@class BRExpandingViewController;

@protocol BRSidebarViewController <NSObject>

@property (nonatomic, weak) BRExpandingViewController *expandingViewController;
@property (nonatomic) enum BRExpandingMenuState *menuState;

- (void)sidebarWillOpen;
- (void)sidebarDidOpen;
- (void)sidebarWillClose;
- (void)sidebarDidClose;

@end

@protocol BRContentViewController <NSObject>

@property (nonatomic, weak) BRExpandingViewController *expandingViewController;
@property (nonatomic) enum BRExpandingMenuState *menuState;

- (void)sidebarWillOpen;
- (void)sidebarDidOpen;
- (void)sidebarWillClose;
- (void)sidebarDidClose;

@end

@interface BRExpandingViewController : UIViewController

@property (nonatomic, strong) UIViewController<BRSidebarViewController> *sidebarVC;
@property (nonatomic, strong) UIViewController<BRContentViewController> *contentVC;

- (BOOL)shouldOpenSidebar:(UIViewController *)sender;
- (BOOL)shouldCloseSidebar:(UIViewController *)sender;

@end