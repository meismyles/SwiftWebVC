//
//  ObjcViewController.m
//  SwiftWebVCExample
//
//  Created by L4grange on 26/02/2018.
//  Copyright © 2018 Myles Ringle. All rights reserved.
//

#import "ObjcViewController.h"
#import "SwiftWebVCExample-Swift.h"

@interface ObjcViewController () <SwiftWebVCDelegate>

@end

@implementation ObjcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonPressed:(UIButton *)sender {
	SwiftWebVC *webVC = [[SwiftWebVC alloc] initWithUrlString:@"https://www.google.com" sharingEnabled:YES];
	webVC.delegate = self;
	[self.navigationController pushViewController:webVC animated:YES];
}

- (IBAction)modalButtonPressed:(UIButton *)sender {
	SwiftModalWebVC *webVC = [[SwiftModalWebVC alloc] initWithUrlString:@"https://www.google.com" sharingEnabled:YES];
	[self presentViewController:webVC animated:YES completion:nil];
}

-(void)didStartLoading {
	NSLog(@"ObjC: Started loading.");
}

-(void)didFinishLoadingWithSuccess:(BOOL)success {
	NSLog(@"ObjC: Finished loading. Success: %@.", success ? @"YES" : @"NO" );
}

@end
