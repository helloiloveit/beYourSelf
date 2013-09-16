//
//  View2.m
//  BeYourSelf
//
//  Created by huyheo on 9/13/13.
//  Copyright (c) 2013 imac. All rights reserved.
//

#import "View2.h"
#import "ConstantDefinition.h"

@interface View2 ()

@end

@implementation View2

// handle the swipes here
- (void)handleSegue
{
    [self performSegueWithIdentifier:     @"go_to_next_view" sender: NULL];
    
}
- (void)swipeDetected:(UISwipeGestureRecognizer *)gesture
{
    DebugLog(@"gesture.direction = %d", gesture.direction);
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)swipeDetected2:(UISwipeGestureRecognizer *)gesture
{
    DebugLog(@"gesture.direction = %d", gesture.direction);
    [self handleSegue];
}
-(void)initSwipe
{
    /*
     UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeScreen:)];
     swipe.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
     [self.view addGestureRecognizer:swipe];
     */
    UISwipeGestureRecognizer *swipeRecognizer =
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(swipeDetected:)];
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight ;
    
    
    [self.view addGestureRecognizer:swipeRecognizer];
    
    UISwipeGestureRecognizer *swipeRecognizer2 =
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(swipeDetected2:)];
    swipeRecognizer2.direction = UISwipeGestureRecognizerDirectionLeft ;
    
    
    [self.view addGestureRecognizer:swipeRecognizer2];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSwipe];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
