//
//  ViewController.m
//  DrawTriangle
//
//  Created by Sebastian Bock on 03.12.14.
//  Copyright (c) 2014 Apptivity. All rights reserved.
//

#import "ViewController.h"
#import "TriangleView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TriangleView *triangleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.triangleView setState:won forPart:leftTrianglePartType];
    [self.triangleView setState:lost forPart:rightTrianglePartType];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
