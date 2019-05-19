//
//  Photo.m
//  Cats
//
//  Created by Frances ZiyiFan on 5/16/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithFarm: (NSString *)farm andServer: (NSString *)server andID: (NSString *)ID andSecret: (NSString *)secret
{
    self = [super init];
    if (self) {
//        _farm = farm;
//        _server = server;
//        _ID = ID;
//        _secret = secret;
        _photoURL = @"https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg";
        _photoURL = [_photoURL stringByReplacingOccurrencesOfString:@"{farm-id}" withString:[NSString stringWithFormat:@"%@",farm]];
        _photoURL = [_photoURL stringByReplacingOccurrencesOfString:@"{server-id}" withString:[NSString stringWithFormat:@"%@",server]];
        _photoURL = [_photoURL stringByReplacingOccurrencesOfString:@"{id}" withString:[NSString stringWithFormat:@"%@",ID]];
        _photoURL = [_photoURL stringByReplacingOccurrencesOfString:@"{secret}" withString:[NSString stringWithFormat:@"%@",secret]];
        NSLog(@"%@", _photoURL);
        _image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_photoURL]]];
    }
    return self;
}

+ (instancetype)parseJSONDictionary: (NSDictionary *)json{
    return [[Photo alloc]initWithFarm:json[@"farm"] andServer:json[@"server"] andID:json[@"id"] andSecret:json[@"secret"]];
}

@end
