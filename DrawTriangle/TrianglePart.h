//
//  TrianglePart.h
//  DrawTriangle
//
//  Created by Sebastian Bock on 04.12.14.
//  Copyright (c) 2014 Apptivity. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TrianglePartType) {
    leftTrianglePartType,
    rightTrianglePartType,
    bottomTrianglePartType
};

typedef NS_ENUM(NSInteger, PlayState) {
    unplayed,
    played,
    won,
    lost
};

@interface TrianglePart : NSObject
@property (nonatomic) TrianglePartType type;
@property (nonatomic) PlayState playState;
- (instancetype)initWithTrianglePart:(TrianglePartType)part playState:(PlayState)state;
@end
