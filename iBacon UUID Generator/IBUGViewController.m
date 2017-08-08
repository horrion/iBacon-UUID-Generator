//
//  IBUGViewController.m
//  iBacon UUID Generator
//
//  Created by Robert Horrion on 6/24/14.
//  Copyright (c) 2014 Robert Horrion. All rights reserved.
//

#import "IBUGViewController.h"

@interface IBUGViewController ()

@end

@implementation IBUGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"iBacon UUID";
    
    shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(hitShare:)];
    
    self.navigationItem.rightBarButtonItem = shareButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)hitShare:(id)sender
{
    if (uuidTF.text && uuidTF.text.length == 0)
    {
        UIAlertView *noTextAlert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please generate a UUID before sharing it!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [noTextAlert show];
    }
    else
    {
    NSString *uuidStr = uuidTF.text;
    NSArray *shareArray = @[uuidStr];
    UIActivityViewController *shareString = [[UIActivityViewController alloc] initWithActivityItems:shareArray applicationActivities:nil];
    shareString.excludedActivityTypes = @[UIActivityTypePostToFacebook, UIActivityTypePostToFlickr, UIActivityTypePostToTencentWeibo, UIActivityTypePostToTwitter, UIActivityTypePostToWeibo, UIActivityTypePostToVimeo];
    [self presentViewController:shareString animated:YES completion:nil];
    }
}

-(IBAction)generateButton:(id)sender
{
    NSString *UUID = [[NSUUID UUID] UUIDString];
    uuidTF.text = UUID;
}

-(IBAction)clearButton:(id)sender
{
    uuidTF.text = @"";
}

-(IBAction)copyButton:(id)sender
{
    [UIPasteboard generalPasteboard].string = uuidTF.text;
}

@end
