# <img src="https://github.com/Damso-ForSmoker/Damso-iOS/assets/87518434/0f5a853e-24f7-43f8-b31e-31d01516baee" align="center" width="50" height="50"></img> Damso-iOS
<img src="https://github.com/Damso-ForSmoker/Damso-iOS/assets/87518434/dd407deb-71fc-41df-b8a3-2924bf886fd6" align="center" width="40%" height="40%"> <img src="https://github.com/Damso-ForSmoker/Damso-iOS/assets/87518434/6ed9c3c5-59c6-4cdc-abb1-a53323b66aaf" align="center" width="40%">

***더이상 흡연구역 힘들게 찾지 말고 어플리케이션을 통해 쉽고 간편하게 찾자!***
### 프로젝트 개요
- `Naver Cloud Platform MapsAPI`를 활용한 서비스 개발
   - `Mobile Dynamic Map SDK`를 활용한 **지도 표현** 및 `Marker` 표시
   - `Reverse GeoCoding API`를 활용한 **좌표의 주소화**


## 📱주요 화면
|화면 명|스크린 샷|
|--|--|
|흡연구역 제보하기|<img src="https://user-images.githubusercontent.com/87518434/217380840-32a40ce2-e416-474d-a82a-b53e373f319f.png" width = "30%" height = "30%"></img><img src="https://github.com/Damso-ForSmoker/Damso-iOS/assets/87518434/320c4a65-c035-484a-af89-0a72f050f876" width = "30%" height = "30%"></img>|
|사용자 제보|<img src="https://github.com/Damso-ForSmoker/Damso-iOS/assets/87518434/2206e7e3-5311-4497-8f7a-09e1c99c42e2" width = "30%" height = "30%"></img>|


## 🛠️개발
***개발기간***
> 개발 기간: 2023.01.04. ~ 02.18. (6주)
---------
***⚙️개발 환경***   
- Supported Destination : `iPhone`
- Minimum Deployments : `16.0`   
  - because of `UISheetPresentationController.Detent` Custom detent
- Package Management : `CocoaPods`

***⚙️기술스택***
- BaseSDK: `UIKit`
- CodeBaseUI: `SnapKit`, `Then`
- Network: `Alamofire`, `SwiftyJSON`
- Map: `CoreLocation`, `Naver Cloud Platform Mobile Dynamic Map SDK`

----------
***개발간 중점사항***
- **팀 협업 프로세스 중심 프로젝트**   
  본 프로젝트는 PM, 디자이너, iOS, Server(Node.js) 팀원이 협업하여 만든 프로젝트로써 협업 프로세스로 진행했습니다.
  <img width="287" alt="스크린샷 2024-01-29 오후 5 39 10" src="https://github.com/Damso-ForSmoker/Damso-iOS/assets/87518434/29da13d7-f234-4652-85cb-beac875c2902"> <img width="500" alt="스크린샷 2024-01-29 오후 5 40 25" src="https://github.com/Damso-ForSmoker/Damso-iOS/assets/87518434/7a2e7ebe-bc53-4f0b-8e44-6901570162f0">
   
   
- **Reverse Geocoding(CoorToAddr) API**[(API Response 문서 링크)](https://api.ncloud-docs.com/docs/ko/ai-naver-mapsreversegeocoding-gc)   
  사용자가 표시하는 지도상의 좌표를 주소명으로 표기하기 위해서 Reverse Geocodin API를 이용하였습니다.   
  대한민국의 현 주소 체계는 대개 도로명 주소로 표기되나, 도로명 주소 체계로 모든 좌표를 변환 및 표현할 수 는 없습니다. 그렇기 때문에 **최대한 도로명 주소로 사용자에게 보여주지만, 도로명 주소로 표기할 수 없는 좌표는 지번 주소로 사용자에게 표기** 되어야 합니다.   
  즉, API Response에서 도로명 주소가 있는지 확인하고 도로명 주소가 response에 있다면 도로명 주소를, 도로명 주소가 없다면 지번 주소를 가져와 사용자에게 표현해주어야 합니다.   
  본 프로젝트에서는 이러한 프로세스를 ***`SwiftyJSON`을 활용하여 JSON에 바로 접근하여 도로명 주소의 유무를 판단, 디코딩하는 방식을 활용***하여 해결하였습니다.

  ```Swift
  if !value.results.isEmpty {
                    let address = value.results[0].region
                    
                    if value.results.count == 4 {//모든 주소가 나오는 좌표라면 도로명 주소를 출력
                      addressString = "\(address.area1.name) \(address.area2.name)" //시/도 + 시/군/구
                        if let name = value.results[3].land?.name {
                          addressString = "\(addressString) \(name)"
                      }
                      
                        if let roadNumber1 = value.results[3].land?.number1 {
                          addressString = "\(addressString) \(roadNumber1)"
                        
                            if let roadNumber2 = value.results[3].land?.number2 {
                                if !roadNumber2.isEmpty {
                                    addressString = "\(addressString)-\(roadNumber2)"
                          }
                        }
                      }
                    } else {
                      addressString = "\(address.area1.name) \(address.area2.name) \(address.area3.name)"
                      
                        if value.results.count > 2 {
                            if let detail1 = value.results[2].land?.number1 {
                            addressString = "\(addressString) \(detail1)"
                          
                                if let detail2 = value.results[2].land?.number2{
                                   if !detail2.isEmpty {
                                     addressString = "\(addressString)-\(detail2)"
                                }
                          }
                        }
                      }
                    }
                    completionHandler(addressString)
                } else {
                    completionHandler("주소가 없는 좌표입니다.")
                }
  ```

   
