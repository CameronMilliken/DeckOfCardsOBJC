//
//  DVMCard.m
//  DeckOfCardsC
//
//  Created by Cameron Milliken on 12/31/18.
//  Copyright © 2018 Cameron Milliken. All rights reserved.
//

#import "DVMCard.h"

@implementation DVMCard


// MARK: - Initialization
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSArray *cards = dictionary[@"cards"];
        NSDictionary *cardDictionary = [cards firstObject];
        NSString *image = cardDictionary[@"image"];
        _image = image;
    }
    return self;
}

@end

