//
//  DVMCardController.m
//  DeckOfCardsC
//
//  Created by Cameron Milliken on 12/31/18.
//  Copyright © 2018 Cameron Milliken. All rights reserved.
//

#import "DVMCardController.h"
#import "DVMCard.h"

@implementation DVMCardController


+ (void)fetchCardWithCompletion:(void (^)(DVMCard *))completion

{
    NSURL *baseUrl = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/?count=1"];
    NSLog(@"%@", baseUrl.absoluteString);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:baseUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        if (data == nil) {
            NSLog(@"there was an error getting the card");
            completion(nil);
            return;
        }
        NSDictionary *cardDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (cardDictionary == nil) {
            completion(nil);
            return;
        }
        
        DVMCard *card = [[DVMCard alloc] initWithDictionary:cardDictionary];
        completion(card);
    }]resume];
}
+ (void)fetchCardImageWith:(DVMCard *)card completion:(void (^)(UIImage * _Nonnull))completion
{
    //URL
    NSURL *imageUrl = [NSURL URLWithString:[card image]];
    
    //DataTask and resume
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
        NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
        completion(nil);
        return;
    }
      
      
      
    if (data == nil) {
        NSLog(@"there was an error getting the card");
        completion(nil);
        return;
    }
    UIImage *cardImage = [[UIImage alloc] initWithData:data];
    completion(cardImage);
      }]resume];
    
}
@end


