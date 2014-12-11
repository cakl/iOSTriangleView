//
//  TriangleView.m
//  DrawTriangle
//
//  Created by Sebastian Bock on 03.12.14.
//  Copyright (c) 2014 Apptivity. All rights reserved.
//

#import "TriangleView.h"
#import "TrianglePart.h"

@interface TriangleView ()
@property (nonatomic, strong) NSDictionary* triangle;
@end

@implementation TriangleView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.unplayedColor = [UIColor whiteColor];
        self.playedColor = [UIColor blackColor];
        self.lostColor = [UIColor redColor];
        self.wonColor = [UIColor greenColor];
        
        TrianglePart* left = [[TrianglePart alloc] initWithTrianglePart:leftTrianglePartType playState:unplayed];
        TrianglePart* right = [[TrianglePart alloc] initWithTrianglePart:rightTrianglePartType playState:unplayed];
        TrianglePart* bottom = [[TrianglePart alloc] initWithTrianglePart:bottomTrianglePartType playState:unplayed];
        self.triangle = @{
                          [NSNumber numberWithInteger:leftTrianglePartType] : left,
                          [NSNumber numberWithInteger:rightTrianglePartType] : right,
                          [NSNumber numberWithInteger:bottomTrianglePartType] : bottom
                          };
    }
    return self;
}


-(void)setState:(PlayState)state forPart:(TrianglePartType)part{
    TrianglePart* changingPart = [self.triangle objectForKey:[NSNumber numberWithInteger:part]];
    changingPart.playState = state;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.lineColor = self.superview.backgroundColor;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat margin = 0.5;
    CGFloat lineWidth = 1.5;
    UIColor* lineColor = self.lineColor;
    
    CGPoint bottomLeft = CGPointMake(CGRectGetMinX(rect)+margin, CGRectGetMaxY(rect)-margin);
    CGPoint topMid = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect)+margin);
    CGPoint bottomRigh = CGPointMake(CGRectGetMaxX(rect)-margin, CGRectGetMaxY(rect)-margin);
    CGFloat centroidX = 0.3333 * (bottomLeft.x+topMid.x+bottomRigh.x);
    CGFloat centroidY = 0.3333 * (bottomLeft.y+topMid.y+bottomRigh.y);
    CGPoint centroid = CGPointMake(centroidX, centroidY);
    
    
    //left triangle
    TrianglePart* leftTriangle = [self.triangle objectForKey:[NSNumber numberWithInteger:leftTrianglePartType]];
    UIColor* leftTriangleCurrentColor = [self colorByState:leftTriangle.playState];
    CGContextBeginPath(ctx);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);
    CGContextMoveToPoint   (ctx, bottomLeft.x, bottomLeft.y);  // bottom left
    CGContextAddLineToPoint(ctx, centroid.x, centroid.y);
    CGContextAddLineToPoint(ctx, topMid.x, topMid.y);
    CGContextClosePath(ctx);
    CGContextSetFillColorWithColor(ctx, leftTriangleCurrentColor.CGColor);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    //right triangle
    TrianglePart* rightTriangle = [self.triangle objectForKey:[NSNumber numberWithInteger:rightTrianglePartType]];
    UIColor* rightTriangleCurrentColor = [self colorByState:rightTriangle.playState];
    CGContextBeginPath(ctx);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);
    CGContextMoveToPoint   (ctx, topMid.x, topMid.y);  //top mid
    CGContextAddLineToPoint(ctx, centroidX, centroidY);
    CGContextAddLineToPoint(ctx, bottomRigh.x, bottomRigh.y);
    CGContextClosePath(ctx);
    CGContextSetFillColorWithColor(ctx, rightTriangleCurrentColor.CGColor);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    //bottom triangle
    TrianglePart* bottomTriangle = [self.triangle objectForKey:[NSNumber numberWithInteger:bottomTrianglePartType]];
    UIColor* bottomTriangleCurrentColor = [self colorByState:bottomTriangle.playState];
    CGContextBeginPath(ctx);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);
    CGContextMoveToPoint   (ctx, bottomRigh.x, bottomRigh.y);  //bottom right
    CGContextAddLineToPoint(ctx, centroidX, centroidY);
    CGContextAddLineToPoint(ctx, bottomLeft.x, bottomLeft.y);
    CGContextClosePath(ctx);
    CGContextSetFillColorWithColor(ctx, bottomTriangleCurrentColor.CGColor);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
}

-(UIColor*)colorByState:(PlayState)state{
    switch (state) {
        case unplayed:
            return self.unplayedColor;
            break;
        case played:
            return self.playedColor;
            break;
        case lost:
            return self.lostColor;
            break;
        case won:
            return self.wonColor;
            break;
        default:
            return self.unplayedColor;
            break;
    }
}


@end
