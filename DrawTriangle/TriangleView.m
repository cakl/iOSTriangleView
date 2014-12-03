//
//  TriangleView.m
//  DrawTriangle
//
//  Created by Sebastian Bock on 03.12.14.
//  Copyright (c) 2014 Apptivity. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat margin = 0.5;
    CGFloat lineWidth = 1.5;
    //UIColor* lineColor = [UIColor colorWithRed:34.0/255 green:126.0/255 blue:175.0/255 alpha:1.0];
    UIColor* lineColor = [UIColor whiteColor];
    
    CGPoint bottomLeft = CGPointMake(CGRectGetMinX(rect)+margin, CGRectGetMaxY(rect)-margin);
    CGPoint topMid = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect)+margin);
    CGPoint bottomRigh = CGPointMake(CGRectGetMaxX(rect)-margin, CGRectGetMaxY(rect)-margin);
    CGFloat centroidX = 0.3333 * (bottomLeft.x+topMid.x+bottomRigh.x);
    CGFloat centroidY = 0.3333 * (bottomLeft.y+topMid.y+bottomRigh.y);
    CGPoint centroid = CGPointMake(centroidX, centroidY);
    
    CGContextBeginPath(ctx);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);
    CGContextMoveToPoint   (ctx, bottomLeft.x, bottomLeft.y);  // bottom left
    CGContextAddLineToPoint(ctx, centroid.x, centroid.y);
    CGContextAddLineToPoint(ctx, topMid.x, topMid.y);
    CGContextClosePath(ctx);
    CGContextSetRGBFillColor(ctx, 34.0/255, 192.0/255, 171.0/255, 1);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    CGContextBeginPath(ctx);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);
    CGContextMoveToPoint   (ctx, topMid.x, topMid.y);  //top mid
    CGContextAddLineToPoint(ctx, centroidX, centroidY);
    CGContextAddLineToPoint(ctx, bottomRigh.x, bottomRigh.y);
    CGContextClosePath(ctx);
    CGContextSetRGBFillColor(ctx, 34.0/255, 192.0/255, 171.0/255, 1);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    CGContextBeginPath(ctx);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);
    CGContextMoveToPoint   (ctx, bottomRigh.x, bottomRigh.y);  //bottom right
    CGContextAddLineToPoint(ctx, centroidX, centroidY);
    CGContextAddLineToPoint(ctx, bottomLeft.x, bottomLeft.y);
    CGContextClosePath(ctx);
    CGContextSetRGBFillColor(ctx, 0, 0, 0, 1);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
}


@end
