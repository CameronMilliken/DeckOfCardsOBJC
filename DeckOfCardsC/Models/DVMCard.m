//
//  DVMCard.m
//  DeckOfCardsC
//
//  Created by Cameron Milliken on 12/31/18.
//  Copyright © 2018 Cameron Milliken. All rights reserved.
//

#import "DVMCard.h"

@implementation DVMCard

-(instancetype)initWithSuit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self) {
        _suit = [suit copy];
        _image = [image copy];
        
    }
    return self;
}


@end

@implementation DVMCard (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *suit = dictionary [@"suit"];
    NSString *image = dictionary [@"image"];
    return [self initWithSuit:suit image:image];
}

@end
