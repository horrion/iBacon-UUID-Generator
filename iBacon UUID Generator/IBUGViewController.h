//
//  IBUGViewController.h
//  iBacon UUID Generator
//
//  Created by Robert Horrion on 6/24/14.
//  Copyright (c) 2014 Robert Horrion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IBUGViewController : UIViewController
{
    IBOutlet UITextView *uuidTF;
    
    UIBarButtonItem *shareButton;
}

-(IBAction)generateButton:(id)sender;
-(IBAction)clearButton:(id)sender;
-(IBAction)copyButton:(id)sender;

@end
