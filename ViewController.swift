import NMapsMap
import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, NMFMapViewCameraDelegate {

    // NMFNaverMapView 객체 선언
    var mapView: NMFNaverMapView!
    // 위치 관리자 객체 선언
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 지도 뷰 초기화 및 화면에 추가
        mapView = NMFNaverMapView(frame: view.frame)
        view.addSubview(mapView)
        
        // 지도 UI 설정
        mapView.showLocationButton = true      // 현재 위치 버튼 표시
        mapView.showIndoorLevelPicker = true   // 실내 층 피커 표시
        mapView.showCompass = true             // 나침반 표시
        mapView.showScaleBar = true            // 축척 바 표시

        // 카메라 델리게이트 설정
        mapView.mapView.addCameraDelegate(delegate: self)

        // 위치 관리자 설정
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()  // 위치 권한 요청

        // 역삼역의 위도와 경도 설정
        let yeoksam = NMGLatLng(lat: 37.5002, lng: 127.0368)
        
        // 카메라 위치 설정
        let cameraUpdate = NMFCameraUpdate(scrollTo: yeoksam)
        cameraUpdate.animation = .easeIn  // 부드러운 애니메이션 효과
        //cameraUpdate.zoom = 15            // 줌 레벨 설정
        
        // 카메라 업데이트 적용
        mapView.mapView.moveCamera(cameraUpdate)

        // 역삼역에 마커 추가
        let marker = NMFMarker()
        marker.position = yeoksam
        marker.mapView = mapView.mapView
        marker.captionText = "역삼역"
    }
    
    // 위치 권한 상태 변경 시 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("위치 권한 승인됨")
            locationManager.startUpdatingLocation()  // 위치 업데이트 시작
        case .denied, .restricted:
            print("위치 권한 거부됨")
        default:
            break
        }
    }
    
    // 위치가 업데이트될 때 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        print("현재 위치: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        // 현재 위치로 카메라 이동 (필요한 경우 주석 해제)
        // let currentPosition = NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
        // let cameraUpdate = NMFCameraUpdate(scrollTo: currentPosition)
        // mapView.mapView.moveCamera(cameraUpdate)
    }
    
    // 위치 업데이트 실패 시 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 업데이트 실패: \(error.localizedDescription)")
    }

    // NMFMapViewCameraDelegate 메서드 (필요한 경우 구현)
    func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
        print("카메라 변경 이유: \(reason), 애니메이션: \(animated)")
    }
}
