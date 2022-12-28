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
 # BehaviorSubject
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

let p = PublishSubject<Int>()

p.subscribe { print("PublishSubject >>", $0) }
    .disposed(by: disposeBag)

// behaviorSubject를 생성할 때는 하나의 값을 전달한다.
// 새로운 구독자가 생성되면 저장된 next이벤트가 바로 전달된다
let b = BehaviorSubject<Int>(value: 0)
b.subscribe { print("BehaviorSubject >>", $0) }
    .disposed(by: disposeBag)

b.onNext(1)

b.subscribe { print("BehaviorSubject2 >>", $0) }
    .disposed(by: disposeBag)

b.onCompleted()

// subject로 completed이벤트가 전달되었기때문에 next이벤트는 다른 observer로 더이상 전달되지 않는다
b.subscribe { print("BehaviorSubject3 >>", $0) }
    .disposed(by: disposeBag)
