//
//  DVMCard.h
//  DeckOfCardsC
//
//  Created by Cameron Milliken on 12/31/18.
//  Copyright © 2018 Cameron Milliken. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

@property (nonatomic, copy, readonly) NSString* suit;
@property (nonatomic, copy, readonly) NSString* image;

-(instancetype)initWithSuit:(NSString *) suit
                      image:(NSString *) image;

@end

@interface DVMCard (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary <NSString *, id >*)dictionary;

@end

NS_ASSUME_NONNULL_END
