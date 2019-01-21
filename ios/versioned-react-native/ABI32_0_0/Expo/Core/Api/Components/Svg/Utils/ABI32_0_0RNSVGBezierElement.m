/*

 Erica Sadun, http://ericasadun.com
 https://github.com/erica/iOS-Drawing/tree/master/C08/Quartz%20Book%20Pack/Bezier
 */

#import "ABI32_0_0RNSVGBezierElement.h"

#pragma mark - Bezier Element -

@implementation ABI32_0_0RNSVGBezierElement
- (instancetype) init
{
    self = [super init];
    if (self)
    {
        _elementType = kCGPathElementMoveToPoint;
        _point = ABI32_0_0RNSVGNULLPOINT;
        _controlPoint1 = ABI32_0_0RNSVGNULLPOINT;
        _controlPoint2 = ABI32_0_0RNSVGNULLPOINT;
    }
    return self;
}

+ (instancetype) elementWithPathElement: (CGPathElement) element
{
    ABI32_0_0RNSVGBezierElement *newElement = [[self alloc] init];
    newElement.elementType = element.type;

    switch (newElement.elementType)
    {
        case kCGPathElementCloseSubpath:
            break;
        case kCGPathElementMoveToPoint:
        case kCGPathElementAddLineToPoint:
        {
            newElement.point = element.points[0];
            break;
        }
        case kCGPathElementAddQuadCurveToPoint:
        {
            newElement.point = element.points[1];
            newElement.controlPoint1 = element.points[0];
            break;
        }
        case kCGPathElementAddCurveToPoint:
        {
            newElement.point = element.points[2];
            newElement.controlPoint1 = element.points[0];
            newElement.controlPoint2 = element.points[1];
            break;
        }
        default:
            break;
    }

    return newElement;
}

// Convert one element to ABI32_0_0RNSVGBezierElement and save to array
void ABI32_0_0RNSVGBezierElement_getBezierElements(void *info, const CGPathElement *element)
{
    NSMutableArray *bezierElements = (__bridge NSMutableArray *)info;
    if (element)
        [bezierElements addObject:[ABI32_0_0RNSVGBezierElement elementWithPathElement:*element]];
}

// Retrieve array of component elements
+ (NSArray *) elementsFromCGPath:(CGPathRef)path
{
    NSMutableArray *elements = [NSMutableArray array];
    CGPathApply(path, (__bridge void *)elements, ABI32_0_0RNSVGBezierElement_getBezierElements);
    return elements;
}

@end

