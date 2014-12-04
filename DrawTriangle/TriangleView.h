//
//  TriangleView.h
//  DrawTriangle
//
//  Created by Sebastian Bock on 03.12.14.
//  Copyright (c) 2014 Apptivity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrianglePart.h"

@interface TriangleView : UIView
@property (nonatomic, strong) UIColor* unplayedColor;
@property (nonatomic, strong) UIColor* playedColor;
@property (nonatomic, strong) UIColor* wonColor;
@property (nonatomic, strong) UIColor* lostColor;
@property (nonatomic, strong) UIColor* lineColor;
-(void)setState:(PlayState)state forPart:(TrianglePartType)part;
@end
