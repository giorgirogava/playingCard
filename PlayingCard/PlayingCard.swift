//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by IMAC on 28.10.21.
//

import Foundation


struct PlayingCard: CustomStringConvertible {
    
    
    var description: String {return "\(rank)\(suit)"}
    
    
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
            
        // MARK: stored properties
        var description: String
        
     
        case spades = "♠️"
        case hearts = "❤️"
        case diamonds = "♣️"
        case clubs = "♦️"
        
        static var all = [Suit.spades, .hearts, .diamonds, .clubs]
        
        
    }
    
    enum Rank: CustomStringConvertible {
        
        // MARK: stored properties
        var description: String
        
       
        case ace
        case face(String)
        case numeric(Int)
        
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
                
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
                
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            
            for pips in 2...10 {
             
                allRanks.append(Rank.numeric(pips))
                
            }
            
            allRanks += [Rank.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
        
    }
    
}
