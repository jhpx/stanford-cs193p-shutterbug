//
//  FlickrPhotoAnnotation.m
//  Shutterbug
//
//  Created by 姜孟冯 on 13-9-28.
//  Copyright (c) 2013年 姜孟冯. All rights reserved.
//

#import "FlickrPhotoAnnotation.h"
#import "FlickrFetcher.h"

@implementation FlickrPhotoAnnotation

+ (FlickrPhotoAnnotation *)annotationForPhoto:(NSDictionary *)photo
{
    FlickrPhotoAnnotation *annotation = [[FlickrPhotoAnnotation alloc] init];
    annotation.photo = photo;
    return annotation;
}

#pragma mark - MKAnnotation

- (NSString *)title
{
    return (self.photo)[FLICKR_PHOTO_TITLE];
}

- (NSString *)subtitle
{
    return [self.photo valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
}

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [(self.photo)[FLICKR_LATITUDE] doubleValue];
    coordinate.longitude = [(self.photo)[FLICKR_LONGITUDE] doubleValue];
    return coordinate;
}

@end

