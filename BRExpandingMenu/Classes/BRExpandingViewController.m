//
//  BRExpandingViewController.m
//  BRExpandingMenuExample
//
//  Created by Bradley Ringel on 3/30/14.
//  Copyright (c) 2014 Bradley Ringel. All rights reserved.
//

#import "BRExpandingViewController.h"

const NSInteger BRSidebarOpenWidth = 300;
const NSInteger BRSidebarClosedWidth = 100;

@interface BRExpandingViewController ()

@end

@implementation BRExpandingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menuState = BRExpandingMenuStateClosed;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldOpenSidebar:(UIViewController *)sender{
    if(self.menuState == BRExpandingMenuStateClosed){
        [self.sidebarVC sidebarWillOpen];
        [self.contentVC sidebarWillOpen];
        NSLog(@"Opening sidebar");
        self.menuState = BRExpandingMenuStateOpen;
        self.sidebarVC.menuState = BRExpandingMenuStateOpen;
        self.contentVC.menuState = BRExpandingMenuStateOpen;
        
        //animate the transitions here
        CGRect sidebarFrame = self.sidebarView.frame;
        CGRect newFrame = CGRectMake(sidebarFrame.origin.x, sidebarFrame.origin.y, BRSidebarOpenWidth,sidebarFrame.size.height);
        self.sidebarView.frame = newFrame;
        
        CGRect contentFrame = self.contentView.frame;
        CGRect screenSize = [[UIScreen mainScreen] bounds];
        CGRect newContentFrame = CGRectMake(newFrame.origin.x + BRSidebarOpenWidth ,contentFrame.origin.y , screenSize.size.width - BRSidebarOpenWidth, contentFrame.size.height);
        self.contentView.frame = newContentFrame;
        [self.sidebarVC sidebarDidOpen];
        [self.contentVC sidebarDidOpen];
        [self.sidebarView setNeedsDisplay];
        [self.contentView setNeedsDisplay];
        return true;

    }
    else{
        return false;
    }
}

- (BOOL)shouldCloseSidebar:(UIViewController *)sender{
    if(self.menuState == BRExpandingMenuStateOpen){
        [self.sidebarVC sidebarWillClose];
        [self.contentVC sidebarWillClose];
        NSLog(@"Closing sidebar");
        self.menuState = BRExpandingMenuStateClosed;
        self.sidebarVC.menuState = BRExpandingMenuStateClosed;
        self.contentVC.menuState = BRExpandingMenuStateClosed;
        
        CGRect sidebarFrame = self.sidebarView.frame;
        CGRect newSidebarFrame = CGRectMake(sidebarFrame.origin.x, sidebarFrame.origin.y, BRSidebarClosedWidth, sidebarFrame.size.height);
        self.sidebarView.frame = newSidebarFrame;
        
        CGRect contentFrame = self.contentView.frame;
        CGRect screenSize = [[UIScreen mainScreen] bounds];
        CGRect newContentFrame = CGRectMake(newSidebarFrame.origin.x + BRSidebarClosedWidth, contentFrame.origin.y, screenSize.size.width - BRSidebarClosedWidth, contentFrame.size.height);
        self.contentView.frame = newContentFrame;
        [self.sidebarView setNeedsDisplay];
        [self.contentView setNeedsDisplay];
        
        [self.contentVC sidebarDidClose];
        [self.sidebarVC sidebarDidClose];
        
        return true;
    }
    else{
        return false;
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqual:@"embedSidebar"]){
        UIViewController<BRSidebarViewController> *sidebar = segue.destinationViewController;
        sidebar.menuState = BRExpandingMenuStateClosed;
        sidebar.expandingViewController = self;
        self.sidebarVC = sidebar;
    }
    else if([segue.identifier isEqualToString:@"embedContent"]){
        UIViewController<BRContentViewController> *content = segue.destinationViewController;
        content.menuState = BRExpandingMenuStateClosed;
        content.expandingViewController = self;
        self.contentVC = content;
    }
}


@end
