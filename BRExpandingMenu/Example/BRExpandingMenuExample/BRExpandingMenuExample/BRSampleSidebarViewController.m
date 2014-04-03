//
//  BRSampleSidebarViewController.m
//  BRExpandingMenuExample
//
//  Created by Bradley Ringel on 4/2/14.
//  Copyright (c) 2014 Bradley Ringel. All rights reserved.
//

#import "BRSampleSidebarViewController.h"

@interface BRSampleSidebarViewController ()

@end

@implementation BRSampleSidebarViewController

@synthesize expandingViewController = _expandingViewController;
@synthesize menuState = _menuState;

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
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    self.tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:self.tapGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)tapGesture{
    if(self.menuState == BRExpandingMenuStateClosed){
        [self.expandingViewController shouldOpenSidebar:self];
    }
    else{
        [self.expandingViewController shouldCloseSidebar:self];
    }
}

- (void)sidebarWillOpen{
    
}

- (void)sidebarDidOpen{
    
}

- (void)sidebarWillClose{
    
}

- (void)sidebarDidClose{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
