//
//  SecondViewController.m
//  TabTest
//
//  Created by ias on 2014. 1. 13..
//  Copyright (c) 2014년 ias. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation SecondViewController {
    NSString *_changedSharedStr;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"second init");
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        //SecondVC(self)가 delegate.sharedStr에 관심있다
        [delegate addObserver:self forKeyPath:@"sharedStr" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"SECOND");
	// Do any additional setup after loading the view.
    [self refreshTextField];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"key %@", keyPath);
    _changedSharedStr = [change objectForKey:NSKeyValueChangeNewKey];
    [self refreshTextField];
}

- (void)refreshTextField {
    self.textField.text = _changedSharedStr;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
