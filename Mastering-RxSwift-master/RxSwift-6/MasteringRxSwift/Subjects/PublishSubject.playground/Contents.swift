//
//  Mastering RxSwift
//  Copyright (c) KxCoding <help@kxcoding.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//


import UIKit
import RxSwift

/*:
 # PublishSubject
 */
//Observable은 다른 Observable을 구독하지 못하고, Observer는 다른 Observer로 이벤트를 전달하지 못한다.
//
//Subject는 다른 Observable로부터 이벤트를 받아서 구독자로 전달할 수 있다.
//
//Observable인 동시에 Observer이다.

//RxSwift가 제공하는 4가지 Sbuject

//Subject로 전달되는 새로운 이벤트를 구독자로 전달함
//
//BehaviorSubject
//
//생성시점에 시작이벤트를 지정함
//
//Subject로 전달되는 이벤트 중에서 가장 마지막에 전달된 최신 이벤트를 저장해두었다가, 새로운 구독자에세 최신 이벤트를 전달한다.
//
//ReplaySubject
//
//하나 이상의 최신 이벤트를 버퍼에 저장함

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}






