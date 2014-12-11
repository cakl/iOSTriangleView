iOSTriangleView
===============

Test Project for a triangular UIView

![alt text](http://f.cl.ly/items/4106320x2X0d0h191j1C/iphone6_spacegrey_side1.png "Logo Title Text 1")

Color for different states and states can be set on TriangleView 
```objc
@interface TriangleView : UIView
@property (nonatomic, strong) UIColor* unplayedColor;
@property (nonatomic, strong) UIColor* playedColor;
@property (nonatomic, strong) UIColor* wonColor;
@property (nonatomic, strong) UIColor* lostColor;
@property (nonatomic, strong) UIColor* lineColor;
-(void)setState:(PlayState)state forPart:(TrianglePartType)part;
@end
```

Available states and parts
```objc
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
```
