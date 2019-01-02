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

// MARK: - Properties
@property (nonatomic, readonly) NSString *image;

// MARK: - Initialization
- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
