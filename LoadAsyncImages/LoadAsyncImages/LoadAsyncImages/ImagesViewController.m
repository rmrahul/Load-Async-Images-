//
//  ImagesViewController.m
//  LoadAsyncImages
//
//  Created by Rahul Mane on 24/09/15.
//  Copyright (c) 2015 Rahul Mane. All rights reserved.
//

#import "ImagesViewController.h"
#import "BlockOperationWithIdentifire.h"

@interface ImagesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSCache *imageCache;
@property (nonatomic, strong) NSOperationQueue *imageOperationQueue;

@end

@implementation ImagesViewController
{
    NSMutableArray *arrayOfImageURLS;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Make Up view with Expandable Tableview,Pullable drawer,Movie player,Image Operation queues etc
#pragma mark -
/**
 @author         Rahul N. Mane
 @function       setUp
 @discussion     This function will make UI for this view by using tableview with custom cell.
 @param          nil
 @result         Set up view with Tableview.
 */

-(void)setUp{
    self.imageCache=[[NSCache alloc]init];
    self.imageOperationQueue = [[NSOperationQueue alloc]init];
    self.imageOperationQueue.maxConcurrentOperationCount = 2;
    
    
    arrayOfImageURLS=[[NSMutableArray alloc]init];
    [arrayOfImageURLS addObject:@"https://cdn0.iconfinder.com/data/icons/glyph_set/128/apple.png"];
    [arrayOfImageURLS addObject:@"http://t1.gstatic.com/images?q=tbn:ANd9GcQQigy-U6KTXke82n5hma5qvFM2UyVnkGtJme6pkZgl_1GYM--Yb90oqnOJ"];
    [arrayOfImageURLS addObject:@"http://t0.gstatic.com/images?q=tbn:ANd9GcSKivshcGyHbfSjZeYa8jy9KwoJ-KDI2Wl5glZ3cKOvzzIP2_-lxIaZJeBJ"];

    [arrayOfImageURLS addObject:@"http://t1.gstatic.com/images?q=tbn:ANd9GcQ8ARWo8lp6HCWwo7WT1DTlofY93spEQawMLJ5sC7wBN6wwrjrnFL7gYnc"];
    [arrayOfImageURLS addObject:@"http://t2.gstatic.com/images?q=tbn:ANd9GcQEuijIwUO2oe7gphzcOf1yrzLhoZc64fRoQfhdaxXEexZD_7o3ZLwK4O8"];
    
    [arrayOfImageURLS addObject:@"http://t2.gstatic.com/images?q=tbn:ANd9GcSh_t0OywHn02Csf57TUKFuiRJMPDZM3pfGWsQGEO2ocJKkEIBG2JNpQg"];
    [arrayOfImageURLS addObject:@"http://t0.gstatic.com/images?q=tbn:ANd9GcQBJ3Z1hbAXD7tP7MCjLY0GJMgqAMHySKPcIbbCBprFGUEFAMoQf9g8QZRO"];
    [arrayOfImageURLS addObject:@"http://t1.gstatic.com/images?q=tbn:ANd9GcRpZyXXWBk0TJuU6PCdvrgrU7QckCJQ5DP96iyLc6uLx1bQn4EvBZDFLCk"];
    
    [arrayOfImageURLS addObject:@"http://t0.gstatic.com/images?q=tbn:ANd9GcTEE1gr73va1uGhZC_unHKq-cDD3aC0GJzuo3E7O6AaW19fAl2eRACJraE"];

    
    //
    [arrayOfImageURLS addObject:@"http://t2.gstatic.com/images?q=tbn:ANd9GcQC69_RzZnAGg5To0B1GTddf_3EJARRZ8gnBDqdzitLJMzfJILlunuO_w4L"];
    
    [arrayOfImageURLS addObject:@"http://t1.gstatic.com/images?q=tbn:ANd9GcTwUipqff7taJcClmgl4mMCCTUGA87ojAB6Fm6oJOydFe50Xs8eT0LxlqM"];
    
    [arrayOfImageURLS addObject:@"http://t0.gstatic.com/images?q=tbn:ANd9GcR9_Mx5AvMbDTxkQwZIvlIwxniZjPIyH8xH-wP401QHlQipYoc_26uqBJBf"];
    
    [arrayOfImageURLS addObject:@"http://t1.gstatic.com/images?q=tbn:ANd9GcRDZ4A4bF_lC_RXrXI8NNgROJGgUkO4yLwML0ijVmdakBU-GOj4_xcEAsk"];
    
    [arrayOfImageURLS addObject:@"http://t1.gstatic.com/images?q=tbn:ANd9GcR8GYxtw43VdiF8nTA_MPwBnnhBP3Qx7AHdl688dVI5RMqHNcVq6NFFPU0"];
    
    [arrayOfImageURLS addObject:@"http://t3.gstatic.com/images?q=tbn:ANd9GcS-9w_Pb5O53joGjD311vPyufpPv-EFRQqj0SdYoy7uy7TfYhq4Zw2r1hY"];
    
    [arrayOfImageURLS addObject:@"http://t1.gstatic.com/images?q=tbn:ANd9GcTjKhb_YIPvnn2TAOYUC98aK4CE4qNBGgOtM4fy6m1ROnsKhI4bRi_2nF-2"];
    
    [arrayOfImageURLS addObject:@"http://t2.gstatic.com/images?q=tbn:ANd9GcSiB_wtHyIEPC7P8WR2MC2BSeOELJJ07Lr72MnjmCtDhZMaZhrPmMhdP9BQ"];
    
    [arrayOfImageURLS addObject:@"http://t3.gstatic.com/images?q=tbn:ANd9GcRZRW5kwd53OPfLe2z3XncyvkDjkmClapHhahk7b1aruuDR65nuh6tDyL4"];
    
    [arrayOfImageURLS addObject:@"http://t2.gstatic.com/images?q=tbn:ANd9GcTC8mTuieT-IwyeWRNSrfdnMc1vZwFob9nQOMrtdZe38iJGV3EGZouFS0lw"];
    
    [arrayOfImageURLS addObject:@"http://t0.gstatic.com/images?q=tbn:ANd9GcTmGs5eCsZWRFf8Dra83Q44dz_eXG87R2PjifBCFiwtD6eOqTXwAQJBCc4"];
    
    [arrayOfImageURLS addObject:@"http://t2.gstatic.com/images?q=tbn:ANd9GcQhr9QRJ734QRJSDkF2luE-bFr9gnSk6xUU05j_GD7A3PxEMT80KiixLkI"];
    
    [arrayOfImageURLS addObject:@"http://t3.gstatic.com/images?q=tbn:ANd9GcSCs_oLUkduKMjnYI7lvh75xeHtzgoHp4AYQqpz6Tb2AktvK_oyJxVO7Z5p"];
    
    [arrayOfImageURLS addObject:@"http://t0.gstatic.com/images?q=tbn:ANd9GcR-hfh7fnw8DIAKc2YsYszxxJHqWiGdFtMMlXyUds9vkfPGzwS_3zX-bEma"];
    
    [arrayOfImageURLS addObject:@"http://t2.gstatic.com/images?q=tbn:ANd9GcQM34bGqkJD3AFUJIIL8boOfLZxisQPuBiFiePxXxTPAhLray65p1EApgq-"];
    
    [arrayOfImageURLS addObject:@"http://t0.gstatic.com/images?q=tbn:ANd9GcRd_wFLXm_6yYrW-TMISz9gdcyIll9tiFI-BwozMjDSYv2vN81vjUW-6Ek"];

    
}


#pragma mark - Handling tableview Delegates
#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayOfImageURLS.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"imageCell"];
    
    UIImageView *imageView=(UIImageView *)[cell viewWithTag:100];
    imageView.layer.cornerRadius=3;
    imageView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    imageView.layer.borderWidth=0.75;
   
    
    NSString *imageURL=[arrayOfImageURLS objectAtIndex:indexPath.row];
    NSString *imageID;
    
    
    UIImage *imageFromCache = [self.imageCache objectForKey:[NSString stringWithFormat:@"%@",imageURL]];
    
    
    if (imageFromCache) {
        imageView.image=imageFromCache;
    }else{
        
        imageView.image = nil;//user a placeholder later
        BlockOperationWithIdentifire *operation = [BlockOperationWithIdentifire blockOperationWithBlock:^{
            
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
            
            UIImage *img = [UIImage imageWithData:imageData];
            if (img) {
                [self.imageCache setObject:img forKey:[NSString stringWithFormat:@"%@",imageURL]];
            }
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                UITableViewCell *updateCell =(UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
                if (updateCell) {
                    
                    UIImageView *updatedImageView=(UIImageView *)[cell viewWithTag:100];

                    updatedImageView.layer.cornerRadius=3;
                    updatedImageView.layer.borderColor=[UIColor lightGrayColor].CGColor;
                    updatedImageView.layer.borderWidth=0.75;
                    updatedImageView.image = img;
                    
                    CATransition *transition = [CATransition animation];
                    transition.duration = 0.75f;
                    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                    transition.type = kCATransitionFade;
                    
                    [updatedImageView.layer addAnimation:transition forKey:nil];
                    updatedImageView.contentMode=UIViewContentModeScaleAspectFit;
                    updatedImageView.clipsToBounds = YES;
                    
                }
            }];
        }];
        operation.queuePriority = NSOperationQueuePriorityNormal;
        operation.identifire=imageURL;
        [self.imageOperationQueue addOperation:operation];
    }

    
    
    return cell;
}


#pragma mark - Handling Tableview Scroll view Delegate.
#pragma mark -


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if(!decelerate)
    {
        [self setPriorityForVisibleCells];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setPriorityForVisibleCells];
}


#pragma mark - Helpers

/**
 @author         Rahul N. Mane
 @function       setPriorityForVisibleCells
 @discussion     It handles operation queue for image download.If user scrolls down then priority of image download changes
 @param          nil
 @result         Makes queuePriority in Operation queue for image download.
 */
- (void)setPriorityForVisibleCells
{
    for(NSIndexPath *indexPath in [self.tableview indexPathsForVisibleRows]) {
        for(BlockOperationWithIdentifire *operation in self.imageOperationQueue.operations) {
            NSString *strImageURL=[arrayOfImageURLS objectAtIndex:indexPath.row];
            if([operation.identifire isEqual:strImageURL]) {
                operation.queuePriority = NSOperationQueuePriorityHigh;
            }else {
                operation.queuePriority = NSOperationQueuePriorityLow;
            }
        }
    }
}


@end
