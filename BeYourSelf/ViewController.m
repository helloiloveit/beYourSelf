//
//  ViewController.m
//  BeYourSelf
//
//  Created by imac on 9/12/13.
//  Copyright (c) 2013 imac. All rights reserved.
//

#import "ViewController.h"
#import "ConstantDefinition.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)handleSegue
{
    [self performSegueWithIdentifier:     @"go_to_view2" sender: NULL];

}
// handle the swipes here
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
    [self initSwipe];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
