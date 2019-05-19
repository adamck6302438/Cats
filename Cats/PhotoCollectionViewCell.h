//
//  PhotoCollectionViewCell.h
//  Cats
//
//  Created by Frances ZiyiFan on 5/16/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *image;

@end

NS_ASSUME_NONNULL_END
