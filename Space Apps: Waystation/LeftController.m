//
//  LeftController.m
//  DDMenuController
//
//  Created by Devin Doty on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LeftController.h"
#import "SAWWaystationViewController.h"
#import "DDMenuController.h"
#import "SAWAppDelegate.h"
#import "SAWFullScreenCell.h"

@implementation LeftController

@synthesize tableView=_tableView;

- (id)init {
    if ((self = [super init])) {
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//    pan.delegate = (id<UIGestureRecognizerDelegate>)self;
//    [self.view addGestureRecognizer:pan];
//    _pan = pan;

   
    if (!_tableView) {
        
        CGRect frame = self.view.bounds;
        //frame.origin.x = 0.0f;
        frame.size.width -= 60.0f;
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        tableView.delegate = (id<UITableViewDelegate>)self;
        tableView.dataSource = (id<UITableViewDataSource>)self;
        tableView.scrollEnabled=NO;
        [self.view addSubview:tableView];
        self.tableView = tableView;
        self.tableView.separatorColor  = [UIColor clearColor];
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.tableView = nil;
}

#pragma mark - Temporary Hack Gesture

- (void)pan:(UIPanGestureRecognizer*)gesture {
    [self.root showRootController:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAWFullScreenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SAWFullScreenCell"];
    if (!cell) {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"SAWFullScreenCell" owner:self options:nil];
        cell = [cellArray objectAtIndex: 0];
    }
    return cell;
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    return @"";
}

- (CGFloat)tableView:tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // set the root controller
//    DDMenuController *menuController = (DDMenuController*)((SAAppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
//    FeedController *controller = [[FeedController alloc] init];
//    controller.title = [NSString stringWithFormat:@"Cell %i", indexPath.row];
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
//
//    [menuController setRootController:navController animated:YES];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}



@end
