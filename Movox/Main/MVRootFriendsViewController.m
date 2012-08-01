//
//  MVRootFriendsViewController.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <FBiOSSDK/FacebookSDK.h>
#import "MVViewSizeMacro.h"
#import "MVRootFriendsViewController.h"
#import "MVFacebookSessionController.h"
#import "MVFacebookRequestor.h"

@interface MVRootFriendsViewController ()
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation MVRootFriendsViewController
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self addTableView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)addTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SizeOfScreen.width, SizeOfScreen.height - SizeOfStatusBar.height - SizeOfNavigationBar.height - SizeOfToolBar.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [MVFacebookRequestor sharedObject].friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if(!cell){
        cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, SizeOfTableCell.width, SizeOfTableCell.height)];
    }
    
    MVFacebookUser *friend = [[MVFacebookRequestor sharedObject].friends objectAtIndex:indexPath.row];
    cell.imageView.image = friend.profileImage;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    cell.textLabel.text = friend.name;
    
    return cell;
}


@end
