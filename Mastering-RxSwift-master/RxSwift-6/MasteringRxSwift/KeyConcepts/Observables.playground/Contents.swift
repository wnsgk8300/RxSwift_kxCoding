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
 # Observables
 */
/*
// Observable을 생성하는 방법은 크게 두가지가 있다

// #1 create연산자로 동작을 직접 구현
// create연산자는 Observable타입 protocol에 선언되어있는 type 메서드이다
// RxSwift에서는 이런 메서드들을 연산자라고 부른다
// 여기서는 observer를 받아서 Disposable을 방출함

Observable<Int>.create { (observer) -> Disposable in
    // 구독자로 0이 저장되어있는 next 이벤트가 전달됨
    observer.on(.next(0))
    // onNext 메서드 사용도 괜찮음
    observer.onNext(1)
    // 마지막으로 onCompleted를 전달하고 observable을 종료한다
    // 이후에 다른 이벤트는 전달할 수 없다
    observer.onCompleted()
    
    // 마지막엔 disposable을 return해야함
    // 이는 메모리 정리에 필요한 객체이다
    return Disposables.create()
}
.take(1) // 이렇게 새로운 연산자를 추가해도 아직 Observable를 정의만 할 뿐, Observer로 전달하지 않았다

// #2 create가 아닌 다른 연산자 사용
// 미리 정해진 규칙에 따라서 event를 전달함.
// from 연산자를 활용해서, create 연산자로 만든 observable과 동일한 이벤트를 전할하는 observable을 생성
// from: parameter로 전달한 배열에 있는 요소를 순서대로 방출하고, completed이벤트를 전달하는 observable을 생성
// 이렇게 단순히 순서대로 방출되는 observable을 생성할 때는 create로 직접 구현보다 from같은 다른 연산자 활용하는게 좋다
Observable.from([0, 1])

// 여기까지는 observable이 생성만 되었을 뿐
// 정수가 방출되거나 event가 전달되지 않는다
// observable은 이벤트가 어떤 순서로 전달되어야 하는지 정의할 뿐

// observer가 observable을 구독하는 순간 이벤트가 전달된다
*/



let o1 = Observable<Int>.create { (observer) -> Disposable in
    observer.on(.next(0))
    observer.onNext(1)
    observer.onCompleted()
    return Disposables.create()
}

// #1 하나의 closure를 통해서 모든 이벤트를 처리
o1.subscribe {
    print("== Start ==")
    print($0)
    // event에 저장된 값은 element로 얻을 수 있음
    // 형식이 optional이므로 이를 풀어줘야한다
    if let elem = $0.element {
        print(elem)
    }
    print("== End ==")
}

print("---------------------------------------")

// #2 개별 event를 별도의 closure에서 처리
// parameter들 기본값은 nil이다

// clsure parameter로 next event에 저장된 요소가 바로 전달된다
// subscribe 메서드를 호출하고 closure를 전달하면 event가 closure로 전달된다
o1.subscribe(onNext: { elem in
    print(elem)
})

Observable.from([1, 2, 3])
