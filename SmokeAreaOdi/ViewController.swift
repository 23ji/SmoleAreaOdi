import NMapsMap
import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, NMFMapViewCameraDelegate {
    
    var mapView: NMFNaverMapView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 지도 뷰 초기화
        let naverMapView = NMFNaverMapView(frame: view.frame)
        view.addSubview(naverMapView)
                
        // 지도 설정
        naverMapView.showLocationButton = true
        naverMapView.showIndoorLevelPicker = true
        naverMapView.showCompass = true
        naverMapView.showScaleBar = true

        // 위치 권한 요청
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        // 권한 요청
        locationManager.requestWhenInUseAuthorization()  // 위치 권한 요청
        locationManager.startUpdatingLocation()  // 위치 업데이트 시작
    }
    
    // 위치 권한 승인 상태 처리
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            // 권한이 승인되었을 때
            print("위치 권한 승인됨")
        case .denied, .restricted:
            // 권한이 거부되었거나 제한됨
            print("위치 권한 거부됨")
        default:
            break
        }
    }
    
    // 현재 위치 업데이트 처리
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        // 지도에 현재 위치 표시
        print("현재 위치: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        // 추가적으로 위치를 지도에 반영할 수 있음
    }
    
    // 위치 업데이트 실패 시 처리
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 업데이트 실패: \(error.localizedDescription)")
    }
}
