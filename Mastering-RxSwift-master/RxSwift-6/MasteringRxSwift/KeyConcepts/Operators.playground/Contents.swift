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
 # Operators
 */

let bag = DisposeBag()

Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9])
// take: source Observable이 방출하는 요소중에서 parameter로 지정한 수만큼 방출하는 새로운 Observable을 생성함
// - 처음 5개의 요소만 전달함
    .take(5)
// 짝수만 filter
    .filter { $0.isMultiple(of: 2) }
    .subscribe { print($0) }
    .disposed(by: bag)

Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9])
// 짝수만 filter
    .filter { $0.isMultiple(of: 2) }
// - 처음 5개의 요소만 전달함
    .take(5)
    .subscribe { print($0) }
    .disposed(by: bag)

