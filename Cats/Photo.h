//
//  Photo.h
//  Cats
//
//  Created by Frances ZiyiFan on 5/16/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject

@property (strong, nonatomic) NSString *photoURL;
@property (strong, nonatomic) NSString *server;
@property (strong, nonatomic) NSString *farm;
@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *secret;
@property (strong, nonatomic) UIImage *image;


- (instancetype)initWithFarm: (NSString *)farm andServer: (NSString *)server andID: (NSString *)ID andSecret: (NSString *)secret;

+ (instancetype)parseJSONDictionary: (NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
