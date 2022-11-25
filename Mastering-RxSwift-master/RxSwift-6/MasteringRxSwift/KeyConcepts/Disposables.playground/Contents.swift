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
 # Disposables
 */
// 3개의 정수를 방출하는 Observable 생성
let Subscription1 = Observable.from([1, 2, 3])
// 구독
    .subscribe(onNext: {elem in
        print("Next", elem)
    }, onError: { error in
        print("Error", error)
    }, onCompleted: {
        print("Completed")
        // parameter로 closure를 전달하면, Observerble과 관련된 모든 Resource가 제건된 후에 호출됨
        // Resource가 해제되는 시점에 무언가를 실행하고 싶을 때 사용하면 됨
    }, onDisposed: {
        print("Disposed")
    })
// 이렇게 객체로 만들어서 dispose할 수도 있음
Subscription1.dispose()

var bag = DisposeBag()

print("-----------------------------------------------------")


//dispose는 Observable가 전달해주는 이벤트가 아니다.
Observable.from(optional: [1, 2, 3])
// 이번하는 하나의 closure에서 모든 이벤트를 처리한다.
    .subscribe {
        print($0)
    }
// RxSwift에서 제안하는 dispose 처리 방법
// subscribe가 return하는 Disposable이 bag에 담긴다
// DisposeBag이 해제될때 같이 해제된다
// ARC의 autoreleasepool과 비슷함
    .disposed(by: bag)

// 이렇게 새로 할당하면 기존의 bag은 자동으로 해제된다
bag = DisposeBag()

// Subcrtiption disposable을 실행 취소에 사용하는 경우
// 1씩 증가하는 정수를 1초 간격으로 방출
// 무한히 방출하는 것을 중단하기위해 dispose사용
let subscription2 = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .subscribe(onNext: {elem in
        print("Next", elem)
    }, onError: { error in
        print("Error", error)
    }, onCompleted: {
        print("Completed")
        // parameter로 closure를 전달하면, Observerble과 관련된 모든 Resource가 제건된 후에 호출됨
        // Resource가 해제되는 시점에 무언가를 실행하고 싶을 때 사용하면 됨
    }, onDisposed: {
        print("Disposed")
    })

//3초 뒤 disposed 메서드 호출
//2까지 방출되고 실행이 취소됨
// next다음 completed는 전달되지않음. 그러므로 dispose를 직접 호출하는 것은 가능한 피해야한다
// 만약 특정시점에 취소해야하면 takeUntil을 사용할 수 있다.
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    subscription2.dispose()
}
