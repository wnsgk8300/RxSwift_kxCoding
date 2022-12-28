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

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

//string이 포함된 next이벤트를 받아서 다른 observer에게 전달할 수 있다.
// subject가 생성되는 시점에는 내부에 아무런 이벤트도 저장되어있지 않다.
let subject = PublishSubject<String>()
// subject도 observer기 때문에 onNext호출 가능
subject.onNext("Hello")
// subject는 observerble이기도 하기 때문에 다른 observer가 구독할 수 있다.

let o1 = subject.subscribe { print(">> 1", $0) }
o1.disposed(by: disposeBag)
// RxSwift를 담은 next이벤트가 subject로 전달되고
// subject는 이 이벤트를 구독자로 전달한다.
subject.onNext("RxSwift")

// o2 observer는 두개의 next이벤트가 전달된 이후에 구독을 시작했기때문에, 이 시점에는 아무런 이벤트도 전달받지 않은다.
let o2 = subject.subscribe { print(">> 2", $0) }
o2.disposed(by: disposeBag)

subject.onNext("Subject")

// 모든 구독자에게 completed, error가 전달된다.
//subject.onCompleted()
subject.onError(MyError.error)

// observable에서 completed이벤트가 전달된 이후에는 더이상 next이벤트가 전달되지 않는다, subject도 마찬가지
let o3 = subject.subscribe { print(">> 3", $0) }
o3.disposed(by: disposeBag)


