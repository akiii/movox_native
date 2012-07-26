//
//  MVRootCameraViewController.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <MobileCoreServices/UTCoreTypes.h>
#import "MVRootCameraViewController.h"
#import "MVMoviePlayerViewController.h"

typedef enum CameraState{
    CameraStateShooting = 0,
    CameraStateChecking = 1
} _CameraState;

@interface MVRootCameraViewController ()
@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (strong, nonatomic) MVMoviePlayerViewController *moviePlayerViewController;
@end

@implementation MVRootCameraViewController
@synthesize imagePickerController, moviePlayerViewController;
@synthesize onCloseCamera;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor blackColor];
        self.moviePlayerViewController = [[MVMoviePlayerViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)cancel{
    [self dismissModalViewControllerAnimated:YES];
    if (self.onCloseCamera) self.onCloseCamera();
}

- (void)startVideoCapture{
    [self.imagePickerController startVideoCapture];
}

- (void)showCameraWithAnimation:(BOOL)animation{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"no camera");
        return;
    }
    
    if (self.imagePickerController) self.imagePickerController = nil;
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePickerController.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeMovie, nil];
    self.imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    self.imagePickerController.delegate = self;
    self.imagePickerController.showsCameraControls = NO;
    self.imagePickerController.navigationBarHidden = NO;
    self.imagePickerController.wantsFullScreenLayout = YES;
    self.imagePickerController.cameraViewTransform = CGAffineTransformScale(self.imagePickerController.cameraViewTransform, 1.0, 1.3);
    
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, screenSize.height-49, screenSize.width, 49)];
    toolBar.tintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
    [self.imagePickerController.view addSubview:toolBar];
        
    UIBarButtonItem *startFinishButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                                                target:self 
                                                                                action:@selector(startVideoCapture)];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                  target:self
                                                                                  action:@selector(cancel)];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:nil
                                                                                   action:nil];
    
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, flexibleSpace, startFinishButton, flexibleSpace, nil]];
    
    [self presentModalViewController:self.imagePickerController animated:animation];
}

- (void)showMovieWithContentUrl:(NSURL *)url{
    [self.moviePlayerViewController playWithContentUrl:url];
    [self presentModalViewController:self.moviePlayerViewController animated:YES];
    
    MVMoviePlayerViewController *__weak aPlayer = self.moviePlayerViewController;
    
    aPlayer.onPressedCancel = ^(){
        [self.moviePlayerViewController dismissModalViewControllerAnimated:NO];
        [self showCameraWithAnimation:NO];
    };
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_2_0,__IPHONE_3_0){

//    NSLog(@"selected");
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self dismissModalViewControllerAnimated:NO];
    
    NSURL *movieUrl = [info valueForKey:UIImagePickerControllerMediaURL];
    [self showMovieWithContentUrl:movieUrl];

//    NSString *movieFileString = [[[info valueForKey:UIImagePickerControllerMediaURL] absoluteString] stringByReplacingOccurrencesOfString:@"file://localhost" withString:@""];
//    UISaveVideoAtPathToSavedPhotosAlbum(movieFileString, nil, nil, nil);    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    if (self.onCloseCamera) self.onCloseCamera();
    [self dismissModalViewControllerAnimated:YES];
}

@end
