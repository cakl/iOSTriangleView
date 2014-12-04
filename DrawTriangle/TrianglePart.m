//
//  TrianglePart.m
//  DrawTriangle
//
//  Created by Sebastian Bock on 04.12.14.
//  Copyright (c) 2014 Apptivity. All rights reserved.
//

#import "TrianglePart.h"

@implementation TrianglePart

- (instancetype)initWithTrianglePart:(TrianglePartType)part playState:(PlayState)state
{
    self = [super init];
    if (self) {
        self.type = part;
        self.playState = state;
    }
    return self;
}

@end
