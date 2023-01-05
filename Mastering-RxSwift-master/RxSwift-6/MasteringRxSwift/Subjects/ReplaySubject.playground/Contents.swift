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
 # ReplaySubject
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}
// 3개의 이벤트를 저장하는 버퍼 생성
let rs = ReplaySubject<Int>.create(bufferSize: 3)

(1...10).forEach { rs.onNext($0) }

rs.subscribe { print("Observer 1 >>", $0) }
    .disposed(by: disposeBag)

rs.subscribe { print("Observer 2 >>", $0) }
    .disposed(by: disposeBag)

rs.onNext(11)

rs.subscribe { print("Observer 3 >>", $0) }
    .disposed(by: disposeBag)

rs.onCompleted()

rs.subscribe { print("Observer 4 >>", $0) }
    .disposed(by: disposeBag)

rs.onError(MyError.error)
rs.subscribe { print("Observer 5 >>", $0) }
    .disposed(by: disposeBag)

/*
Observer 1 >> next(8)
Observer 1 >> next(9)
Observer 1 >> next(10)
Observer 2 >> next(8)
Observer 2 >> next(9)
Observer 2 >> next(10)
Observer 1 >> next(11)
Observer 2 >> next(11)
Observer 3 >> next(9)
Observer 3 >> next(10)
Observer 3 >> next(11)
Observer 1 >> completed
Observer 2 >> completed
Observer 3 >> completed
Observer 4 >> next(9)
Observer 4 >> next(10)
Observer 4 >> next(11)
Observer 4 >> completed
Observer 4 >> next(9)
Observer 4 >> next(10)
Observer 4 >> next(11)
Observer 4 >> completed
*/
