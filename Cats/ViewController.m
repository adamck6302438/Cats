//
//  ViewController.m
//  Cats
//
//  Created by Frances ZiyiFan on 5/16/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *photos;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.photos = @[];
    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=5d3e0e28d7f66f283a648b997c414b8a&tags=cat"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        json = json[@"photos"];
        json = json[@"photo"];
        if(jsonError){
            NSLog(@"json error: %@", jsonError);
            return;
        }
        NSMutableArray *photoArray = [NSMutableArray array];
        for (NSDictionary *photoJSON in json){
            Photo *photo = [Photo parseJSONDictionary: photoJSON];
            [photoArray addObject:photo];
        }
        self.photos = photoArray;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];
    [dataTask resume];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photo" forIndexPath:indexPath];
    Photo *photo = self.photos[indexPath.row];
    photoCell.image = photo.image;
    return photoCell;
}


@end
