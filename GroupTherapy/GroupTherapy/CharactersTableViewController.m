//
//  CharactersTableViewController.m
//  GroupTherapy
//
//  Created by Whitney Lauren on 6/2/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

#import "CharactersTableViewController.h"

#import <CommonCrypto/CommonDigest.h>

#import "CharacterTableViewCell.h"

#define API_BASE @"http://gateway.marvel.com/v1/public/"

#define PUBLIC_KEY @"122c80800b73d7bdbcbda6d2796b99cb"

#define PRIVATE_KEY @"67e691f9da92edfe3f569b1812741d4183dab9e7"


@interface CharactersTableViewController() <UIScrollViewDelegate>

@end

@implementation CharactersTableViewController

{
    
    NSArray * characters;

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self characterList];
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

    - (void)scrollViewDidScroll:(UIScrollView *)scrollView{
        
        float scrollViewHeight = scrollView.frame.size.height;
        float scrollContentSizeHeight = scrollView.contentSize.height;
        float scrollOffset = scrollView.contentOffset.y;
        
        if (scrollOffset == 0)
        {
            
        }
        
        else if (scrollOffset + scrollViewHeight == scrollContentSizeHeight){
            
            [self characterList];
        }
        
    }

- (void)characterList{
    int timeStamp = [NSDate date].timeIntervalSince1970;
    
    NSString * hash = [self MD5String:[NSString stringWithFormat:@"%d%@%@", timeStamp, PRIVATE_KEY, PUBLIC_KEY]];
    
    NSString * endpoint = [NSString stringWithFormat: @"%@characters?limit=50&offset=%d&ts=%d&apikey=%@&hash=%@", API_BASE, characters.count, timeStamp, PUBLIC_KEY, hash];
    NSLog(@"%@", endpoint);
    
    NSURL * url = [NSURL URLWithString:endpoint];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"%@", json);
        
        
        characters = json[@"data"][@"results"];
        characters = [characters arrayByAddingObjectsFromArray:characters];
        
        
        NSLog(@"%@", characters);
        
        [self.tableView reloadData];
        
    }];
}


    
- (NSString *)MD5String: (NSString *)str {
    
    // Create pointer to the string as UTF8
    const char *ptr = [str UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    //Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return characters.count;
}


- (CharacterTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CharacterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"charCell" forIndexPath:indexPath];
    
    NSDictionary * character = characters[indexPath.row];

    cell.cellText.text = characters[indexPath.row][@"name"];
    
    int totalComics = [character[@"comics"][@"available"] intValue];
    NSString * totalComicsText = [NSString stringWithFormat:@"%i", totalComics];
    cell.totalComics.text = totalComicsText;

    
    if (characters[indexPath.row][@"thumbnail"] != nil && characters[indexPath.row][@"thumbnail"] != [NSNull null]) {
    
        NSString * path = characters[indexPath.row][@"thumbnail"][@"path"];
        NSString * extension = characters[indexPath.row][@"thumbnail"][@"extension"];
        NSString * portraitSmall = @"portrait_small";
        
        NSString * completeString = [NSString stringWithFormat: @"%@/%@.%@", path, portraitSmall, extension];
        NSLog(completeString);
        
        NSURL * imageURL = [NSURL URLWithString: completeString];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
        NSData * imageData = [NSData dataWithContentsOfURL: imageURL];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                UIImage * cImage = [UIImage imageWithData: imageData];
                
                
                cell.characterImage.image = cImage;
                
                
            });
            
        });
        
        
        
    }
    
    cell.totalComics.layer.cornerRadius = 30;
    
    return cell;
}






/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
