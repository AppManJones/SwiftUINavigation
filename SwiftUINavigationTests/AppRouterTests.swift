//
//  SwiftUINavigationTests.swift
//  SwiftUINavigationTests
//
//  Created by Joseph Rouleau on 10/22/24.
//

import Testing
@testable import SwiftUINavigation

struct AppRouterTests {
    
    @Test func confirmNavigationPathOnAppRouterAfterPushingAndPopping() async throws {
        
        let sut = AppRouter()
        
        let event = MainAppNavigationEvent(eventType: .push, screen: .home)
        sut.handle(event)
        
        #expect(!sut.path.isEmpty)
        #expect(sut.path.count == 1)
        
        let event2 = MainAppNavigationEvent(eventType: .push, screen: .detail)
        sut.handle(event2)
        
        #expect(!sut.path.isEmpty)
        #expect(sut.path.count == 2)
        
        sut.pop()
        
        #expect(!sut.path.isEmpty)
        #expect(sut.path.count == 1)
        
        sut.pop()
        
        #expect(sut.path.isEmpty)

    }
    
    @Test func confirmNavigationPathOnAppRouterAfterPushingAndPoppingToRoot() async throws {
        
        let sut = AppRouter()
        
        let event = MainAppNavigationEvent(eventType: .push, screen: .home)
        sut.handle(event)
        
        #expect(!sut.path.isEmpty)
        #expect(sut.path.count == 1)
        
        let event2 = MainAppNavigationEvent(eventType: .push, screen: .detail)
        sut.handle(event2)
        
        #expect(!sut.path.isEmpty)
        #expect(sut.path.count == 2)
        
        let event3 = MainAppNavigationEvent(eventType: .popToRoot)
        sut.handle(event3)
                
        #expect(sut.path.isEmpty)
    }
    
    @Test func presentAndDismissFullScreenCover() async throws {
        
        let sut = AppRouter()
        
        let event = MainAppNavigationEvent(eventType: .showFullScreenCover, screen: .home)
        sut.handle(event)
        
        #expect(sut.fullScreenCover != nil)
        
        let event2 = MainAppNavigationEvent(eventType: .dismissFullScreenCover)
        sut.handle(event2)
        
        #expect(sut.parent?.fullScreenCover == nil)
    }
    
    @Test func presentAndDismissSheet() async throws {
        
        let sut = AppRouter()
        
        let event = MainAppNavigationEvent(eventType: .showSheet, screen: .detail)
        sut.handle(event)
        
        #expect(sut.sheet != nil)
        
        let event2 = MainAppNavigationEvent(eventType: .dismissSheet)
        sut.handle(event2)
        
        #expect(sut.parent?.sheet == nil)
    }

}
